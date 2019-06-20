-- Manually created


---@class UDim2
UDim2 = {
	---@type UDim
	X=nil,
	---@type UDim
	Y=nil,
	---@type UDim
	Width=nil,
	---@type UDim
	Height=nil
}

---@param x UDim
---@param y UDim
---@return UDim2
function UDim2.new(x, y) end

---@param xScale number
---@param xOffset number
---@param yScale number
---@param yOffset number
---@return UDim2
function UDim2.new(xScale, xOffset, yScale, yOffset) end

---@param other UDim
---@return UDim
function UDim2:__add(other) end

---@param other UDim
---@return UDim
function UDim2:__sub(other) end