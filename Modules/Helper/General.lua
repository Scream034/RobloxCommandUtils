-- ����� Helper
-- ����� paralax034

local PlayersService = game:GetService("Players")

local Module = {}

--- �������� ��� �������� �������� �� ������ ������� � ������.
--- @param From Instance: ������, �� �������� ���������� �������� ��������.
--- @param To Instance: ������, � ������� ���������� �������� ��������.
function Module.CopyChildren(from: Instance, to: Instance): ()
	for _, Child in ipairs(from:GetChildren()) do
		local Clone = Child:Clone()
		Clone.Parent = to
	end
end

return Module