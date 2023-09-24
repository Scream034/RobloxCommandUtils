-- ������ ��� ������ � �������
-- �����: paralax034

local PlayersService = game:GetService("Players")

local Module = {}

--- �������� ������, ���������� � ��������� ������, �� ������ ����� ����a.
--- @param part BasePart: ����, ��� �������� ���� ������.
--- @param name string: (�����������) ��� ����a, ����� ��������� ������������.
--- @return Player?: �����, ��������� � ��������� ������, ��� nil, ���� ����� �� ������.
function Module.GetPlayerByPart(part: BasePart, name: string?): Player?
	if name and part.Name ~= name then return end

	local Character = part.Parent
	if not Character or not Character:IsA("Model") then return end

	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	if not Humanoid then return end

	if Humanoid.Health <= 0 then return end

	return PlayersService:GetPlayerFromCharacter(Character)
end

return Module
