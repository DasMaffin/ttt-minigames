--[[
This Script is made by Instinkt https://steamcommunity.com/id/InstinktServers and is under GPL-3.0 License.
--]]

if SERVER then
    CreateConVar("rps_maintenance", "1", {FCVAR_REPLICATED, FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Enable RPS maintenance mode")
    CreateConVar("notify_minigames", "1", {FCVAR_REPLICATED, FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Notify players about minigames on death")
    
    include("gruber/ttt_minigames/sv_tictactoe.lua")
    AddCSLuaFile("gruber/ttt_minigames/cl_tictactoe.lua")
    AddCSLuaFile("gruber/ttt_minigames/cl_minigames.lua")
    AddCSLuaFile("maffin/ttt_minigames/rock_paper_scissors/cl_rps.lua")
    AddCSLuaFile("maffin/ttt_minigames/rock_paper_scissors/cl_rps_button.lua")

    hook.Add("PlayerDeath", "Gruber.MiniGames.ShowMessage", function(ply)
        if GetConVar("notify_minigames"):GetBool() then
            ply:SendLua([[
                chat.AddText(Color(255,255,255), "Tippe: ", Color(255,255,0), "!minigames ", Color(255,255,255), "um die Minigames zu öffnen!")
            ]])
        end
    end)

else
    include("gruber/ttt_minigames/cl_tictactoe.lua")
    include("gruber/ttt_minigames/cl_minigames.lua")
    include("maffin/ttt_minigames/rock_paper_scissors/cl_rps.lua")
    include("maffin/ttt_minigames/rock_paper_scissors/cl_rps_button.lua")
end
