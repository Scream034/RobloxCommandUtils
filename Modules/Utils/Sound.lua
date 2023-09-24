-- ��� ������ �� �������
-- �����: paralax034

local Module = {}

--- ������ ���� � ������������� ���, ����� ������� ��� ���������.
--- @param originPart BasePart: ����, ������������ �������� ������������� ����.
--- @param id number: ID ����� �� �������� Roblox.
--- @param minDistance number: ����������� ����������, �� ������� ���� ������ ����� ������.
--- @param maxDistance number: ������������ ����������, �� ������� ���� ����� ������ � ����������� ��������� ��������������� �������.
--- @param isWait boolean: ������� �� ��������� ������������ ����� ����� ��������� ������� Part.
--- @param looped boolean|nil: (�����������) ����� �� ���������� ����������� ����. �� ��������� false.
--- @param callback function|nil: (�����������) ������� ��������� ������, ���������� ����� ���������� ������������ �����.
function Module.Play(originPart: BasePart, id: number, minDistance: number, maxDistance: number, isWait: boolean, looped: boolean?, callback: "function"?): ()
	local part = Instance.new("Part", workspace)
	part.Name = "SoundPart_" .. tostring(id)
	part.Anchored = true
	part.Transparency = 1
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false
	part.Position = originPart.Position

	originPart:GetPropertyChangedSignal("CFrame"):Connect(function() 
		part.Position = originPart.Position
	end)

	local sound = Instance.new("Sound", part)
	sound.Looped = looped ~= nil
	sound.SoundId = "rbxassetid://" .. tostring(id)  -- ID ����� �� �������� Roblox
	sound.RollOffMaxDistance = maxDistance
	sound.RollOffMinDistance = minDistance

	if callback then
		sound.Ended:Connect(callback)
	end

	sound:Play()

	if isWait then
		sound.Ended:Wait()
	end

	if not looped then
		spawn(function() 
			wait(sound.TimeLength)
			part:Remove()
		end)
	end
end

return Module
