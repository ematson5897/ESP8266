wifi.setmode(wifi.STATION)
wifi.sta.config("chamberscreek","freegrace")

tries = 0

tmr.alarm(1,1000,1,function()
	print("Connecting... wifi access = " .. wifi.sta.status())
	if wifi.sta.status() == 5 then
		print("done...")
		run()
	else
		tries = tries + 1
		if tries > 30 then
			noWIFI()
		end
	end
end)
	


function run()
	tmr.stop(1)
	print("running file")
	if node.chipid() == 10379351 then
		print("sensorNode")
		dofile("SensorNode.lua") 
	else
		print("LEDNode")
		dofile("LEDNode.lua") 
	end
end

function noWIFI()

end
