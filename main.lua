require('config')
local ntp = require('ntp')

TOPIC = "/sensors/"..LOCATION.."/mq2/data"

gpio.mode(DATA_PIN, gpio.INPUT)

-- Init client with keepalive timer 120sec
m = mqtt.Client(CLIENT_ID, 120, "", "")

-- Sync to NTP server
ntp.sync()

function readData() 
    data = gpio.read(DATA_PIN)
    if data == 1 then return 0 end
    if data == 0 then return 1 end
end

print("Connecting to MQTT: "..BROKER_IP..":"..BROKER_PORT.."...")
m:connect(BROKER_IP, BROKER_PORT, 0, 1, function(conn)
    print("Connected to MQTT: "..BROKER_IP..":"..BROKER_PORT.." as "..CLIENT_ID)
    tmr.alarm(1, REFRESH_RATE, 1, function()
        GAZ = readData()
        DATA = '{"mac":"'..wifi.sta.getmac()..'","ip":"'..wifi.sta.getip()..'",'
        DATA = DATA..'"date":"'..ntp.date()..'","time":"'..ntp.time()..'",'
        DATA = DATA..'"gaz":"'..GAZ..'"}'
        -- Publish a message (QoS = 0, retain = 0)       
        m:publish(TOPIC, DATA, 0, 0, function(conn)
            print(CLIENT_ID.." sending data: "..DATA.." to "..TOPIC)
        end)
    end)
end)