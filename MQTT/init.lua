
print("waiting 5 seconds")

tmr.alarm(5,5000,0,function()
	print("running file")
	if node.chipid() == 10379351 then
		print("sensorNode")
		dofile("SensorNode.lua") 
	else
		print("LEDNode")
		dofile("LEDNode.lua") 
	end
end)
	


