local Tween = game:GetService("TweenService")

local zeroUDim2 = UDim2.new(0, 0, 0, 0)
local tweenSizeInfoOpen = TweenInfo.new(
	0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
local tweenSizeInfoClose = TweenInfo.new(
	0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local tweenPosInfoOpen = TweenInfo.new(
	0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local tweenPosInfoClose = TweenInfo.new(
	1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)

---@class gui_hexagonGrid
local gui_hexagonGrid = {}
gui_hexagonGrid.__index = gui_hexagonGrid


---@param x number
---@param y number
---@param name string
---@param buttonObj GuiButton @ Expected but can vary
---@return GuiButton @ Expected but can vary
function gui_hexagonGrid:createHexButton(x, y, name, buttonObj)
	name = name or "HexagonBtn"
	buttonObj = buttonObj or self.buttonObj
	local dx, dy = self:expectedHexagonPosition(x, y)
	local hexBtnObj = buttonObj:Clone()
	hexBtnObj.Parent = self.parentObj
	hexBtnObj.Position = UDim2.new(0.5, dx-self.offset, 0.5, dy)
	hexBtnObj.Size = zeroUDim2
	hexBtnObj.ImageTransparency = 0
	hexBtnObj.Name = name
	return hexBtnObj
end


---@param v GuiBase2d
function gui_hexagonGrid:openHexagon(v)
	Tween:Create(v, tweenSizeInfoOpen, {
		Size=self.sizeUDim2
	}):Play()
	Tween:Create(v, tweenPosInfoOpen, {
		Position=UDim2.new(0.5, v.Position.X.Offset, 0.5, v.Position.Y.Offset)
	}):Play()
end
function gui_hexagonGrid:open()
	for i, v in pairs(self.parentObj:GetChildren()) do
		self:openHexagon(v)
	end
end

---@param v GuiBase2d
function gui_hexagonGrid:closeHexagon(v)
	local posUDim2
	if v.Position.X.Offset == 0 and v.Position.Y.Offset == 0 then
		posUDim2 = UDim2.new(0.5, v.Position.X.Offset, 0.5, v.Position.Y.Offset)
	else
		local angle = math.atan2(v.Position.Y.Offset, v.Position.X.Offset)
		posUDim2 = UDim2.new(0.5- -math.cos(angle), v.Position.X.Offset, 0.5- -math.sin(angle), v.Position.Y.Offset)
	end
	Tween:Create(v, tweenSizeInfoClose, {
		Size=zeroUDim2
	}):Play()
	Tween:Create(v, tweenPosInfoClose, {
		Position=posUDim2
	}):Play()
end
function gui_hexagonGrid:close()
	for i, v in pairs(self.parentObj:GetChildren()) do
		self:closeHexagon(v)
	end
end

---@param x number
---@param y number
function gui_hexagonGrid:expectedHexagonPosition(x, y)
	local _ixOffset = self.ixOffset
	if y % 2 == 1 then
		_ixOffset = -_ixOffset
	end
	return _ixOffset+x*self.jxOffset, y*self.iyOffset
end

---@param parentObj Instance
---@param buttonObj GuiBase2d
---@return gui_hexagonGrid
function gui_hexagonGrid.new(parentObj, buttonObj)
	local size = Vector2.new(buttonObj.Size.X.Offset, buttonObj.Size.Y.Offset)

	local _hexSize = size.x
	if size.y > _hexSize then
		_hexSize = size.y
	end
	local hexSize = _hexSize/2
	local jxOffset = hexSize*-math.tan( math.pi/1.5 ) --or math.sqrt(3) * hex.radius
	local ixOffset = jxOffset/4
	local iyOffset = jxOffset*math.sin( math.pi/3 )
	local sizeUDim2 = UDim2.new(0, size.x, 0, size.y)

	local hexagonGrid = setmetatable({
		jxOffset=jxOffset,
		ixOffset=ixOffset,
		iyOffset=iyOffset,
		sizeUDim2=sizeUDim2,

		parentObj=parentObj,
		buttonObj=buttonObj,
		size=size
	}, gui_hexagonGrid)

	local offset, _ = hexagonGrid:expectedHexagonPosition(0, 0)
	hexagonGrid.offset = offset

	return hexagonGrid
end

---@return string
function gui_hexagonGrid:__tostring()
	return "HexagonGrid()"
end

return gui_hexagonGrid
