-- ������ UI �������� � ������� Tween
-- �����: paralax034

local TweenService = game:GetService("TweenService")

local Module = {}

--- ������� ����
--- @param obj GuiObject: �������� ������ ��������
--- @param side number: ����� �������
---- 0 - ����
---- 1 - �����
---- 2 - ������
---- 3 - ����
---- 4 - ����� ����
---- 5 - ������ ����
---- 6 - ������ ������ ����
---- 7 - ����� ������ ����
--- @param tweenInfo TweenInfo: ���������� � ��������
--- @param isRemove boolean?: ������� �� ������ ����� ��������
function Module.Slide(obj: GuiObject, side: number, tweenInfo: TweenInfo, isRemove: boolean?): ()
	local startPos = obj.Position

	local targetPosition
	if side == 0 then
		targetPosition = startPos - UDim2.new(1, 0, 0, 0)
	elseif side == 1 then
		targetPosition = startPos - UDim2.new(0, 0, 1, 0)
	elseif side == 2 then
		targetPosition = startPos + UDim2.new(1, 0, 0, 0)
	elseif side == 3 then
		targetPosition = startPos + UDim2.new(0, 0, 1, 0)
	elseif side == 4 then
		targetPosition = startPos - UDim2.new(1, 0, 1, 0)
	elseif side == 5 then
		targetPosition = startPos + UDim2.new(1, 0, -1, 0)
	elseif side == 6 then
		targetPosition = startPos + UDim2.new(1, 0, 1, 0)
	elseif side == 7 then
		targetPosition = startPos - UDim2.new(1, 0, 1, 0)
	end

	local tween = TweenService:Create(obj, tweenInfo, {Position = targetPosition})
	tween:Play()

	if isRemove then
		tween.Completed:Once(function(playbackState) 
			obj:Remove()
		end)
	end
end

--- ������� �����������
--- @param obj GuiObject: �������� ������ ��������
--- @param tweenInfo TweenInfo: ���������� � ��������
--- @param isRemove boolean?: ������� �� ������ ����� ��������
function Module.Fade(obj: GuiObject, tweenInfo: TweenInfo, isRemove: boolean?): ()
	local tweenInfo = tweenInfo

	local tween = TweenService:Create(obj, tweenInfo, {
		BackgroundTransparency = 1
	})
	tween:Play()

	if isRemove then
		tween.Completed:Once(function(playbackState) 
			obj:Remove()
		end)
	end
end

return Module