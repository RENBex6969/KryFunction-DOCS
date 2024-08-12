RunService = game:GetService("RunService")
HttpService = game:GetService("HttpService")

-- // Variables 2
TimeFunction = RunService:IsRunning() and time or os.clock
LastIteration, Start
FrameUpdateTable = {}

-- // Kry
Kry = {}

Kry.HttpGet = function(url)
  data_HttpGet = game:HttpGet(url)
  return data_HttpGet
end

Kry.getHWID = function()
  return tostring(game:GetService("RbxAnalyticsService"):GetClientId())
end

Kry.getIP = function()
  response_IP = game:HttpGet("https://api.ipify.org/?format=json")
  data_IP = HttpService:JSONDecode(response_IP)
  IP = data_IP.ip(IP)
  return tostring(IP)
end

Kry.setFPSCAP = function(args)
  setfpscap(args)
end

Kry.getFPS = function()
  Client_FPS = 0
  function HeartbeatUpdate()
	  LastIteration = TimeFunction()
	  for Index = #FrameUpdateTable, 1, -1 do
		  FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
	  end
	  FrameUpdateTable[1] = LastIteration
	  Client_FPS = tostring(math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start)))
  end
  return Client_FPS
end

Kry.getPING = function()
  PING = math.round(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue())
	return tostring(PING)
end

Kry.getMaxPING = function()
  MaxPING = math.round(game:GetService("Stats"):FindFirstChild("PerformanceStats").MaxPing:GetValue())
	return tostring(MaxPING)
end


Kry.getNetworkRECV = function()
  NetworkRECV = game:GetService("Stats"):FindFirstChild("PerformanceStats").NetworkReceived:GetValue()
  return tostring(NetworkRECV)
end

Kry.getMaxNetworkRECV = function()
  MaxNetworkRECV = game:GetService("Stats"):FindFirstChild("PerformanceStats").MaxNetworkReceived:GetValue()
  return tostring(MaxNetworkRECV)
end

Kry.getNetworkSent = function()
  NetworkSent = game:GetService("Stats"):FindFirstChild("PerformanceStats").NetworkSent:GetValue()
  return tostring(NetworkSent)
end

Kry.getMaxNetworkSent = function()
  MaxNetworkSent = game:GetService("Stats"):FindFirstChild("PerformanceStats").MaxNetworkSent:GetValue()
  return tostring(MaxNetworkSent)
end

Kry.getCPU = function()
  CPU = math.round(game:GetService("Stats"):FindFirstChild("PerformanceStats").CPU:GetValue())
  return tostring(CPU)
end

Kry.getMaxCPU = function()
  MaxCPU = math.round(game:GetService("Stats"):FindFirstChild("PerformanceStats").MaxCPU:GetValue())
	return tostring(MaxCPU)
end


Kry.getGPU = function()
  GPU = math.round(game:GetService("Stats"):FindFirstChild("PerformanceStats").GPU:GetValue())
  return tostring(GPU)
end

Kry.getMaxGPU = function()
  MaxGPU = math.round(game:GetService("Stats"):FindFirstChild("PerformanceStats").MaxGPU:GetValue())
	return tostring(MaxGPU)
end


Kry.getMEMORY = function()
  MEM = math.round(game:GetService("Stats"):FindFirstChild("PerformanceStats").Memory:GetValue())
  return tostring(MEM)
end

Kry.getMaxMEMORY = function()
  MaxMEM = math.round(game:GetService("Stats"):FindFirstChild("PerformanceStats").MaxMemory:GetValue())
	return tostring(MaxMEM)
end

Kry.getExecutorNAME = function()
  return tostring(identifyexecutor())
end

Kry.getExecutorLVL = function()
  return tostring(getthreadidentity())
end

Kry.spoofExecutorLVL = function(arg)
  Kry.spoofExecutorLVL = function(arg)
  orgprintidentity = printidentity;
  orgsethreadidentity = setthreadidentity or set_thread_identity;
  arg = tostring(arg)
  KryHOOK = hookfunction(orgprintidentity, function()
    print("Current identity is " .. arg)
  end)
  KryHOOK2 = hookfunction(orgsethreadidentity, function()
    return arg
  end)
end

return Kry
