-- Manually created

---@class Rect
Rect = {
	-- Properties --
	---@type number
	Width=nil,
	---@type number
	Height=nil,
	---@type Vector2
	Min=nil,
	---@type Vector2
	Max=nil
}
-- Constructors --
---@param min Vector2
---@param max Vector2
---@return Rect
function Rect.new(min, max) end

---@param minX number
---@param minY number
---@param maxX number
---@param maxY number
---@return Rect
function Rect.new(minX, minY, maxX, maxY) end