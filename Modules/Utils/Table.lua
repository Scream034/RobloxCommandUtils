-- ������� ��� ������ � ��������
-- �����: paralax034

local Module = {}

--- ������� ��� �������� �� ������� �� ������
--- @param table {}: �������� �������
--- @param endIndex number: �����
--- @return {}: ������� � ��������� ����������
function Module.RemoveElementsUntilIndex(table: {}, endIndex: number): {}
	local tbl = table.clone(table)

	local i = 1
	while i <= endIndex do
		table.remove(tbl, 1)
		i = i + 1
	end

	return tbl
end

--- �������� �����, ������� �������
--- @param table {}: �������� �������
--- @param keyMappings {}: �����, ������� ����� ��������
--- @return {}: ������� � ����������� ����������
function Module.UpdateExistingKeys(table: {}, keyMappings: {})
	for oldKey, newKey in pairs(keyMappings) do
		if table[oldKey] ~= nil then
			table[newKey] = table[oldKey]
			table[oldKey] = nil
		end
	end
end

return Module