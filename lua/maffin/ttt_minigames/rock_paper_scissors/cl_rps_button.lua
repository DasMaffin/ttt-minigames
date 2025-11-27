local PANEL = {}

PANEL.Icon = nil

function PANEL:Init()
    self:SetText("")
    self:SetSize(354, 150)
    -- self:Dock(RIGHT)
end

function PANEL:Paint(w, h)
    if self.Icon then
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetMaterial(self.Icon)
        surface.DrawTexturedRect(0, 0, w, h)
    end
end

vgui.Register("RPSIconButton", PANEL, "DButton")
