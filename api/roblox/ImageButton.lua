-- Generated by robloxPageToEmmy.py

--- An ImageButton behaves similarly to an ImageLabel in regards to rendering with the additional behaviors of a GuiButton. It defines the same image-rendering properties as a ImageLabel does.
--- You can disable image rendering by setting ImageButton/ImageTransparency to 1. This will leave you with a plain rectangle that can be used as a button. However, it may be better to use a blank TextButton for this.
---@class ImageButton : GuiButton
ImageButton = {
	-- Properties --
	--- A textureId that will be used when ImageButton is being hovered
	---@type string @ RealSignature ContentString
	HoverImage=nil,
	--- The image content displayed by the UI element.
	---@type string @ RealSignature ContentString
	Image=nil,
	--- Determines how a rendered image will be colorized.
	---@type Color3
	ImageColor3=nil,
	--- .The offset in pixels of the sub-area of an image to be displayed
	---@type Vector2
	ImageRectOffset=nil,
	--- Determines the size in pixels of the sub-area of an image to be displayed.
	---@type Vector2
	ImageRectSize=nil,
	--- Determines the transparency of the rendered image.
	---@type number
	ImageTransparency=nil,
	--- Indicates whether the Image has finished loading from the Roblox website.
	--- Tags: ReadOnly, NotReplicated
	---@type boolean
	IsLoaded=nil,
	--- A textureId that will be used when ImageButton is being pressed
	---@type string @ RealSignature ContentString
	PressedImage=nil,
	--- Determines how an image will scale if displayed in a UI element whose size differs from the source image.
	---@type ScaleType
	ScaleType=nil,
	--- Determines the center of a nine-slice image.
	---@type Rect
	SliceCenter=nil,
	--- Scales the 9slice edges by the specified ratio
	---@type number
	SliceScale=nil,
	--- Sets the tiling scale of the ImageButton.
	---@type UDim2
	TileSize=nil
}

-- Functions --


-- Events --