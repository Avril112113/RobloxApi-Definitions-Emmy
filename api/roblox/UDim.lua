-- Manually created


---@class UDim
UDim = {
	---@type number
	Scale=nil,
	---@type number
	Offset=nil
}

---@param scale number
---@param offset number
---@return UDim
function UDim.new(scale, offset) end

---@param other UDim
---@return UDim
function UDim:__add(other) end

---@param other UDim
---@return UDim
function UDim:__sub(other) end