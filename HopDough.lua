getgenv().DoughKing = function()
    local url = 'https://piphuc273.vercel.app/doughking'
    local chooses
    local foundServers = game:GetService('HttpService'):JSONDecode(game:HttpGet(url))
    for i,v in foundServers do 
        if v.jobId ~= game.JobId then 
            chooses = v
        end
    end
    game:GetService("TeleportService"):TeleportToPlaceInstance(7449423635, chooses.jobId, game.Players.LocalPlayer)
end
function CheckBossAttack()
    for _,Boss in pairs(game.Workspace.Enemies:GetChildren()) do
        if Boss.Name == "rip_indra True Form" or Boss.Name == "Dough King" and DetectingPart(Boss) and Boss.Humanoid.Health > 0 then
            return Boss
        end
    end
    for _,Boss in pairs(game.ReplicatedStorage:GetChildren()) do
        if Boss.Name == "rip_indra True Form" or Boss.Name == "Dough King" then
            return Boss
        end
    end
end
function DetectingPart(v1)
    return v1 and v1:FindFirstChild("HumanoidRootPart") and v1:FindFirstChild("Humanoid")
end
spawn(function()
  while task.wait(4) do
    pcall(function()
      if not CheckBossAttack() then
        return DoughKing()
      end
    end)
  end
end)     
