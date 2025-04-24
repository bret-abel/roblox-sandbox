local Toolkit = {
    Table = {}
}

--[[Helper function to convert some basic Lua variable types into corresponding Roblox Instances]]
function Toolkit.CreateInstanceFromValue(value, name, parent)
    local InstanceClassesByLuaType = {
        ["number"] = "NumberValue",
        ["string"] = "StringValue",
        ["boolean"] = "BoolValue",
        ["table"] = "Folder"
    }
	local targetType = typeof(value)
	local newInstance = nil
	
	-- handle basic Lua types
	for luaType, rblxClass in pairs (InstanceClassesByLuaType) do
		if targetType == luaType then
			newInstance = Instance.new(InstanceClassesByLuaType[targetType])
			newInstance.Name = name
			newInstance.Parent = parent
			if rblxClass ~= "Folder" then
				newInstance.Value = value
			end
			return newInstance
		end
	end	
	-- Handle Instances, which are basically just copied	
	if typeof(value) == "Instance" then
		newInstance = Instance.new(value.ClassName, parent)	
		newInstance.Value = value
		newInstance.Name = name
		newInstance.Parent = parent
		return newInstance
	else
	-- this should handle Roblox datatypes that aren't always Instances but maybe can be, like Color3 or Vector3 values
		local possibleClassName = targetType.."Value"
		local success, result = pcall(function()
			return Instance.new(possibleClassName)
		end)
		if success then
			newInstance = result
			newInstance.Value = value
			newInstance.Name = name
			newInstance.Parent = parent
		else
			warn("WARNING: No Roblox Class matching datatype ".."\""..targetType.."\"")
			warn(result)
		end
	end
	return newInstance
end

--[[function to resize model by a given scale factor]]
function Toolkit.ResizeModel (model, scale)
	local primaryPart = model.PrimaryPart
	local primaryCF = primaryPart.CFrame
	
	for _,v in pairs(model:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Size = (v.Size * scale)
			if v ~= primaryPart then
				v.CFrame = (primaryCF + (primaryCF:inverse() * v.Position * scale))
			end
		end
	end

	return model
end

function Toolkit.Table.combine(a, b)
	local result = {}
	for i, element in ipairs(a) do
		table.insert(result, i, element)
	end
	for i, element in ipairs(b) do
		table.insert(result,(i + #a), element)
	end
	return result
end

function Toolkit.Table.deepCopy(original)
	local copy = {}
	for k, v in pairs(original) do
		if type(v) == "table" then
			v = Toolkit.Table.deepCopy(v)
		end
		copy[k] = v
	end
	return copy
end

function Toolkit.Table.deepFreeze(input)
	if typeof(input) == "table" then
		table.freeze(input)
		for _, value in pairs(input) do
			if typeof(value) == "table" then
				Toolkit.Table.deepFreeze(value)
			end
		end
	else
		return
	end
end

function Toolkit.Table.filter(arr, func)
	local new_index = 1
	local size_orig = #arr
	for old_index, v in ipairs(arr) do
		if func(v, old_index) then
			arr[new_index] = v
			new_index = new_index + 1
		end
	end
	for i = new_index, size_orig do 
        arr[i] = nil 
    end
end

function Toolkit.Table.keys(t)
	local keys = {}
	for k, _ in pairs(t) do
		table.insert(keys, k)
	end  
	return keys
end

return Toolkit