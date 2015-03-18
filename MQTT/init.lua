
print("waiting 5 seconds")

tmr.alarm(5,5000,0,function()
	print("running file")
	if node.chipid() == 10379351 do
		dofile("SensorNode.lua") 
	else
		dofile("LEDNode.lua") 
	end
end)
	


