gpio.mode(3,gpio.INT,gpio.PULLUP)
gpio.mode(4,gpio.INT,gpio.PULLUP)
gpio.mode(5,gpio.INT,gpio.PULLUP)
gpio.mode(7,gpio.INT,gpio.PULLUP)

m = mqtt.Client("ESP8266.1", 120, "user", "password")

m:lwt("/lwt", "ESP8266.1 offline", 0, 0)

m:on("connect", function(con) print ("connected") end)
m:on("offline", function(con) print ("offline") end)

m:on("message", function(conn, topic, data) 
  print(topic .. ":" ) 
  if data ~= nil then
    print(data)
  end
end)

m:connect("192.168.2.2", 1883, 0, function(conn) print("connected") end)


--tmr.alarm(1,1000,0,function() m:subscribe("hello/world",0, function(conn) print("subscribe success") end) end)
--tmr.alarm(2,1000,1,led)
tmr.alarm(3,100,0,function() gpio.trig(7, "both", rd1) gpio.trig(5, "both", rd2) gpio.trig(4, "both", rd3) gpio.trig(3, "both", rd4) end)
--tmr.alarm(3,100,0,function() gpio.trig(7, "both", rd1) end)


function rd1()
	print("1")
	state = gpio.read(7)
	m:publish("reed/1",state,0,1, function(conn) print("sent") end)
end

function rd2()
	print("2")
	state = gpio.read(5)
	m:publish("reed/2",state,0,1, function(conn) print("sent") end)
end

function rd3()
	print("3")
	state = gpio.read(4)
	m:publish("reed/3",state,0,1, function(conn) print("sent") end)
end

function rd4()
	print("4")
	state = gpio.read(3)
	m:publish("reed/4",state,0,1, function(conn) print("sent") end)
end
