-- Manually created

---@class CFrame
CFrame = {
	-- Properties --
	---@type number
	X=nil,
	---@type number
	Y=nil,
	---@type number
	Z=nil,
	---@type Vector3
	LookVector=nil,
	---@type Vector3
	RightVector=nil,
	---@type Vector3
	UpVector=nil,
	---@type Vector3
	Position=nil,
}
-- Constructors --
---@return CFrame
function CFrame.new() end

---@param pos Vector3
---@return CFrame
function CFrame.new(pos) end

---@param pos Vector3
---@param lookAt Vector3
---@return CFrame
function CFrame.new(pos, lookAt) end

---@param x number
---@param y number
---@param z number
---@return CFrame
function CFrame.new(x, y, z) end

---@param x number
---@param y number
---@param z number
---@param qx number
---@param qy number
---@param qz number
---@return CFrame
function CFrame.new(x, y, z, qx, qy, qz) end

---@param x number
---@param y number
---@param z number
---@param R00 number
---@param R01 number
---@param R02 number
---@param R10 number
---@param R11 number
---@param R12 number
---@param R20 number
---@param R21 number
---@param R22 number
---@return CFrame
function CFrame.new(x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22) end

---@param rx number
---@param ry number
---@param rz number
---@return CFrame
function CFrame.fromEulerAnglesXYZ(rx, ry, rz) end

---@param rx number
---@param ry number
---@param rz number
---@return CFrame
function CFrame.fromEulerAnglesYXZ(rx, ry, rz) end

---@param rx number
---@param ry number
---@param rz number
---@return CFrame
function CFrame.Angles(rx, ry, rz) end

---@param rx number
---@param ry number
---@param rz number
---@return CFrame
function CFrame.fromOrientation(rx, ry, rz) end

---@param v Vector3
---@param r number
---@return CFrame
function CFrame.fromAxisAngle(v, r) end

---@param pos Vector3
---@param vX number
---@param vY number
---@param vZ number
---@return CFrame
function CFrame.fromMatrix(pos, vX, vY, vZ) end

-- Functions --
---@return CFrame
function CFrame:Inverse() end

---@param goal CFrame
---@param alpha number
---@return CFrame
function CFrame:Lerp(goal, alpha) end

---@param cf CFrame
---@return CFrame
function CFrame:ToWorldSpace(cf) end

---@param cf CFrame
---@return CFrame
function CFrame:ToObjectSpace(cf) end

---@param v3 Vector3
---@return Vector3
function CFrame:PointToWorldSpace(v3) end

---@param v3 Vector3
---@return Vector3
function CFrame:PointToObjectSpace(v3) end

---@param v3 Vector3
---@return Vector3
function CFrame:VectorToWorldSpace(v3) end

---@param v3 Vector3
---@return Vector3
function CFrame:VectorToObjectSpace(v3) end

---@return any[]
function CFrame:GetComponents() end

---@return number, number, number
function CFrame:ToEulerAnglesXYZ() end

---@return number, number, number
function CFrame:ToEulerAnglesYXZ() end

---@return number, number, number
function CFrame:ToOrientation() end

---@return Vector3, number
function CFrame:ToAxisAngle() end

-- Math Operations --
---@param other CFrame
---@return CFrame
function CFrame:__mul(other) end

---@param other Vector3
---@return Vector3
function CFrame:__mul(other) end

---@param other Vector3
---@return CFrame
function CFrame:__add(other) end

---@param other Vector3
---@return CFrame
function CFrame:__sub(other) end
