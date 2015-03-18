gpio.mode(3,gpio.OUTPUT)
gpio.mode(4,gpio.OUTPUT)

m = mqtt.Client("ESP8266.2", 120, "user", "password")

m:lwt("/lwt", "ESP8266.2 offline", 0, 0)

m:on("connect", function(con) print ("connected") end)
m:on("offline", function(con) print ("offline") end)

m:on("message", function(conn, topic, data) 
  print(topic .. ":" ) 
  if data ~= nil then
    print(data)
	gpio.write(3,data)
	gpio.write(4,data)
  end
end)

m:connect("192.168.2.2", 1883, 0, function(conn) print("connected") end)


tmr.alarm(1,1000,0,function() m:subscribe("reed/#",0, function(conn) print("subscribe success") end) end)


