Maffin = Maffin or {}
Maffin.RockPaperScissors = Maffin.RockPaperScissors or {}
Maffin.RockPaperScissors.icons = {
    rock = Material("rock_paper_scissors/r_rock.png"),
    paper = Material("rock_paper_scissors/r_paper.png"),
    scissors = Material("rock_paper_scissors/r_scissors.png")
}
Maffin.RockPaperScissors.margins = {
    x = 10,
    y = 10
}
local cv = GetConVar("rps_maintenance")
Maffin.RockPaperScissors.underConstruction = cv and cv:GetBool() or false
cvars.AddChangeCallback("rps_maintenance", function(convar_name, oldValue, newValue)
    Maffin.RockPaperScissors.underConstruction = tonumber(newValue) ~= 0
end)

Maffin.RockPaperScissors.callback = function(pnl)
    if ULib and Maffin.RockPaperScissors.underConstruction and not LocalPlayer():IsSuperAdmin() then
        local status = pnl:Add("DLabel")
        status:SetContentAlignment(5)
        status:Dock(TOP)
        status:SetTextColor(Color(255, 255, 255))
        status:SetText("This minigame is under construction. Check back later!")
        return
    end

    local title = pnl:Add("DLabel")
    title:SetText("Rock Paper Scissors")
    title:SetContentAlignment(5)
    title:SetTextColor(Color(255, 255, 255))
    title:Dock(TOP)
    local lastHeight = 0
    for _, mat in pairs(Maffin.RockPaperScissors.icons) do
        local icon = pnl:Add("RPSIconButton")
        icon.Icon = mat
        icon:SetPos(0, lastHeight + Maffin.RockPaperScissors.margins.y)
        lastHeight = lastHeight + icon:GetTall()
    end
end