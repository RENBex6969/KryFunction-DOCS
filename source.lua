HttpService = game:GetService("HttpService")
Kry = {}

Kry.getHWID = function()
  return tostring(game:GetService("RbxAnalyticsService"):GetClientId())
end

Kry.getIP = function()
  response_IP = game:HttpGet("https://api.ipify.org/?format=json")
  data_IP = HttpService:JSONDecode(response_IP)
  IP = data_IP.ip(IP)
  return tostring(IP)
end

Kry.getExecutorNAME = function()
  return tostring(identifyexecutor())
end

Kry.getExecutorLVL = function()
  return tostring(getthreadidentity())
end

print("[!] Made by Ren - KryFunctions")

return Kry
