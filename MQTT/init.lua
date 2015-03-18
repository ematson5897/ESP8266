
print("waiting 5 seconds")

tmr.alarm(5,5000,0,function() print("running file") dofile("SensorNode.lua") end)


