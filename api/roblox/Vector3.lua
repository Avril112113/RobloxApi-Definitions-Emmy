-- Manually created

---@class Vector3
Vector3 = {
	-- Properties --
	---@type number
	X=nil,
	---@type number
	Y=nil,
	---@type number
	Z=nil,
	---@type number
	Magnitude=nil,
	---@type Vector3
	Unit=nil
}
-- Constructors --
---@param x number
---@param y number
---@param z number
---@return Vector3
function Vector3.new(x, y, z) end

---@param normal NormalId
---@return Vector3
function Vector3.FromNormalId(normal) end

---@param axis Axis
---@return Vector3
function Vector3.FromNormalId(axis) end

-- Functions --
---@param goal Vector3
---@param alpha number
---@return Vector3
function Vector3:Lerp(goal, alpha) end

---@param other Vector3
---@return number
function Vector3:Dot(other) end

---@param other Vector3
---@return Vector3
function Vector3:Cross(other) end

---@param other Vector3
---@param epsilon number
---@return boolean
function Vector3:isClose(other, epsilon) end

-- Math Operations --
---@param other Vector3
---@return Vector3
function Vector3:__add(other) end
---@param other Vector3
---@return Vector3
function Vector3:__sub(other) end
---@param other Vector3
---@return Vector3
function Vector3:__mul(other) end
---@param other Vector3
---@return Vector3
function Vector3:__div(other) end
---@param other number
---@return Vector3
function Vector3:__mul(other) end
---@param other number
---@return Vector3
function Vector3:__div(other) end