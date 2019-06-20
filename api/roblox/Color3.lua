-- Manually created

---@class Color3
Color3 = {
	-- Properties --
	---@type number
	r=nil,
	---@type number
	g=nil,
	---@type number
	b=nil
}
-- Constructors --
---@return Color3
function Color3.new() end

---@param r number
---@param g number
---@param b number
---@return Color3
function Color3.new(r, g, b) end

---@param r number
---@param g number
---@param b number
---@return Color3
function Color3.fromRGB(r, g, b) end

---@param h number
---@param s number
---@param v number
---@return Color3
function Color3.fromHSV(h, s, v) end

-- Functions --
---@param color Color3
---@param alpha number
---@return Color3
function Color3:Lerp(color, alpha) end

--- Tags: static
---@param color Color3
---@return number, number, number
function Color3.toHSV(color) end