-- Manually created

---@class Vector2
Vector2 = {
	-- Properties --
	---@type number
	X=nil,
	---@type number
	Y=nil,
	---@type number
	Z=nil,
	---@type number
	Magnitude=nil,
	---@type Vector2
	Unit=nil
}
-- Constructors --
---@param x number
---@param y number
---@return Vector2
function Vector2.new(x, y) end

-- Functions --
---@param goal Vector2
---@param alpha number
---@return Vector2
function Vector2:Lerp(goal, alpha) end

---@param other Vector2
---@return number
function Vector2:Dot(other) end

---@param other Vector2
---@return Vector2
function Vector2:Cross(other) end

---@param other Vector2
---@param epsilon number
---@return boolean
function Vector2:isClose(other, epsilon) end