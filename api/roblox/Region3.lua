-- Manually created

---@class Region3
Region3 = {
	-- Properties --
	---@type CFrame
	CFrame=nil,
	---@type Vector3
	Size=nil,
}
-- Constructors --
---@param min Vector3
---@param max Vector3
---@return Region3
function Region3.new(min, max) end

-- Functions --
---@param Region number
---@return Region3
function Region3:ExpandToGrid(Region) end
