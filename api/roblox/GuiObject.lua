-- Generated by robloxPageToEmmy.py

--- GuiObject is an abstract class (much like BasePart) for a 2D user interface object. It defines all the properties relating to the display of a graphical user interface (GUI) object such as GuiObject/Size and GuiObject/Position. It also has some useful read-only properties like GuiObject/AbsolutePosition, GuiObject/AbsoluteSize, and GuiObject/AbsoluteRotation. It should be noted that GuiObject can have negative sizes and render normally, though GuiObject/AnchorPoint ought to be used to better control rendering.
--- To manipulate the layout of a GuiObject in special ways, you can use a UIComponent class such as UIListLayout, UIPadding or UIScale.
--- This class defines very simple animation methods: GuiObject/TweenPosition, GuiObject/TweenSize and GuiObject/TweenSizeAndPosition are good alternatives to TweenService for beginners.
--- GuiObject also defines events for user input like GuiObject/MouseEnter, GuiObject/TouchTap, GuiObject/InputBegan, GuiObject/InputChanged and GuiObject/InputEnded. The last three of these mimic the events of UserinputService of the same name. Although it is possible to detect mouse button events on any GuiObject using GuiObject/InputBegan, only ImageButton and TextButton have dedicated events for these (e.g. TextButton/MouseButton1Down). This event ought not be used for general button activation since not all platforms use a mouse; see TextButton/Activated.
---@class GuiObject : GuiBase2d
GuiObject = {
	-- Properties --
	--- Determines whether a UI element sinks input
	---@type boolean
	Active=nil,
	--- Determines the origin point of a GuiObject|GUI, relative to its absolute size
	---@type Vector2
	AnchorPoint=nil,
	--- Determines aGuiObject|GUI's background color
	---@type Color3
	BackgroundColor3=nil,
	--- Determines the transparency of the GuiObject|GUI's background and border
	---@type number
	BackgroundTransparency=nil,
	--- Determines the color of a GuiObject|GUI's border
	---@type Color3
	BorderColor3=nil,
	--- Determines the pixel width of a GuiObject|GUI's border
	---@type number
	BorderSizePixel=nil,
	--- Determines if descendant GuiObject|GUIs outside of the bounds of a parent GUI element should render
	---@type boolean
	ClipsDescendants=nil,
	--- Controls the sort order of a GuiObject|GUI when used with a UIGridStyleLayout
	---@type number
	LayoutOrder=nil,
	--- Sets the GuiObject which will be selected when the Gamepad selector is moved in this direction
	---@type GuiObject
	NextSelectionDown=nil,
	--- Sets the GuiObject which will be selected when the Gamepad selector is moved in this direction
	---@type GuiObject
	NextSelectionLeft=nil,
	--- Sets the GuiObject|GUI which will be selected when the `Enum/Gamepad selector is moved in this direction
	---@type GuiObject
	NextSelectionRight=nil,
	--- Sets the GuiObject which will be selected when the Gamepad selector is moved in this direction
	---@type GuiObject
	NextSelectionUp=nil,
	--- Determines the pixel and scalar position of a GUI
	---@type UDim2
	Position=nil,
	--- Determines the number of degrees by which a UI element is rotated
	---@type number
	Rotation=nil,
	--- Determine whether the GuiObject|GUI can be selected by a gamepad
	---@type boolean
	Selectable=nil,
	--- Overrides the default selection adornment (used for gamepads)
	---@type GuiObject
	SelectionImageObject=nil,
	--- Determine the pixel and scalar size of a GuiObject|GUI
	---@type UDim2
	Size=nil,
	--- Selects the GuiObject/Size axes that a GuiObject|GUI will be based relative to the size of its parent
	---@type SizeConstraint
	SizeConstraint=nil,
	--- A mixed property of BackgroundTransparency and TextTransparency
	--- Tags: Hidden, NotReplicated
	---@type number
	Transparency=nil,
	--- Determines whether a GuiObject/GUI and its descendants will be rendered
	---@type boolean
	Visible=nil,
	--- Determines the order in which a GuiObject|GUI renders relative to other GUIs
	---@type number
	ZIndex=nil
}

-- Functions --
--- Smoothly moves a GUI to a new DataType/UDim2
---@param _endPosition UDim2
---@param easingDirection EasingDirection
---@param easingStyle EasingStyle
---@param time number
---@param override boolean
---@param callback function
---@return boolean
function GuiObject:TweenPosition(_endPosition, easingDirection, easingStyle, time, override, callback) end

--- Smoothly resizes a GUI to a new DataType/UDim2
---@param _endSize UDim2
---@param easingDirection EasingDirection
---@param easingStyle EasingStyle
---@param time number
---@param override boolean
---@param callback function
---@return boolean
function GuiObject:TweenSize(_endSize, easingDirection, easingStyle, time, override, callback) end

--- Smoothly moves a GUI to a new size and position
---@param _endSize UDim2
---@param _endPosition UDim2
---@param easingDirection EasingDirection
---@param easingStyle EasingStyle
---@param time number
---@param override boolean
---@param callback function
---@return boolean
function GuiObject:TweenSizeAndPosition(_endSize, _endPosition, easingDirection, easingStyle, time, override, callback) end

-- Events --
--- Fired when a user begins interacting via a Human-Computer Interface device (Mouse button down, touch begin, keyboard button down, etc)
---@class __ignore_InputBegan__ : RBXScriptSignal
GuiObject.InputBegan = {Wait=RBXScriptSignal.Wait}
---@param func fun(_input:Instance):void
---@return RBXScriptConnection
function GuiObject.InputBegan:Connect(func) end

--- Fired when a user changes how they�re interacting via a Human-Computer Interface device (Mouse button down, touch begin, keyboard button down, etc)
---@class __ignore_InputChanged__ : RBXScriptSignal
GuiObject.InputChanged = {Wait=RBXScriptSignal.Wait}
---@param func fun(_input:Instance):void
---@return RBXScriptConnection
function GuiObject.InputChanged:Connect(func) end

--- Fired when a user stops interacting via a Human-Computer Interface device (Mouse button down, touch begin, keyboard button down, etc)
---@class __ignore_InputEnded__ : RBXScriptSignal
GuiObject.InputEnded = {Wait=RBXScriptSignal.Wait}
---@param func fun(_input:Instance):void
---@return RBXScriptConnection
function GuiObject.InputEnded:Connect(func) end

--- Fires when a user moves their mouse into a GUI element
---@class __ignore_MouseEnter__ : RBXScriptSignal
GuiObject.MouseEnter = {Wait=RBXScriptSignal.Wait}
---@param func fun(x:number,y:number):void
---@return RBXScriptConnection
function GuiObject.MouseEnter:Connect(func) end

--- Fires when a user moves their mouse out of a GUI element
---@class __ignore_MouseLeave__ : RBXScriptSignal
GuiObject.MouseLeave = {Wait=RBXScriptSignal.Wait}
---@param func fun(x:number,y:number):void
---@return RBXScriptConnection
function GuiObject.MouseLeave:Connect(func) end

--- Fires whenever a user moves their mouse while it is inside a GUI element
---@class __ignore_MouseMoved__ : RBXScriptSignal
GuiObject.MouseMoved = {Wait=RBXScriptSignal.Wait}
---@param func fun(x:number,y:number):void
---@return RBXScriptConnection
function GuiObject.MouseMoved:Connect(func) end

--- Fires when a user scrolls their mouse wheel back when the mouse is over a GUI element
---@class __ignore_MouseWheelBackward__ : RBXScriptSignal
GuiObject.MouseWheelBackward = {Wait=RBXScriptSignal.Wait}
---@param func fun(x:number,y:number):void
---@return RBXScriptConnection
function GuiObject.MouseWheelBackward:Connect(func) end

--- Fires when a user scrolls their mouse wheel forward when the mouse is over a GUI element
---@class __ignore_MouseWheelForward__ : RBXScriptSignal
GuiObject.MouseWheelForward = {Wait=RBXScriptSignal.Wait}
---@param func fun(x:number,y:number):void
---@return RBXScriptConnection
function GuiObject.MouseWheelForward:Connect(func) end

--- Fired when the GuiObject is being focused on with the Gamepad selector
---@class __ignore_SelectionGained__ : RBXScriptSignal
GuiObject.SelectionGained = {Wait=RBXScriptSignal.Wait}
---@param func fun():void
---@return RBXScriptConnection
function GuiObject.SelectionGained:Connect(func) end

--- Fired when the Gamepad selector stops focusing on the GuiObject
---@class __ignore_SelectionLost__ : RBXScriptSignal
GuiObject.SelectionLost = {Wait=RBXScriptSignal.Wait}
---@param func fun():void
---@return RBXScriptConnection
function GuiObject.SelectionLost:Connect(func) end

--- Fires when the player starts, continues and stops long-pressing the UI element
---@class __ignore_TouchLongPress__ : RBXScriptSignal
GuiObject.TouchLongPress = {Wait=RBXScriptSignal.Wait}
---@param func fun(touchPositions:any[],state:UserInputState):void
---@return RBXScriptConnection
function GuiObject.TouchLongPress:Connect(func) end

--- Fires when the player moves their finger on the UI element
---@class __ignore_TouchPan__ : RBXScriptSignal
GuiObject.TouchPan = {Wait=RBXScriptSignal.Wait}
---@param func fun(touchPositions:any[],totalTranslation:Vector2,velocity:Vector2,state:UserInputState):void
---@return RBXScriptConnection
function GuiObject.TouchPan:Connect(func) end

--- Fires when the player performs a pinch or pull gesture using two fingers on the UI element
---@class __ignore_TouchPinch__ : RBXScriptSignal
GuiObject.TouchPinch = {Wait=RBXScriptSignal.Wait}
---@param func fun(touchPositions:any[],scale:number,velocity:number,state:UserInputState):void
---@return RBXScriptConnection
function GuiObject.TouchPinch:Connect(func) end

--- Fires when the player performs a rotation gesture using two fingers on the UI element
---@class __ignore_TouchRotate__ : RBXScriptSignal
GuiObject.TouchRotate = {Wait=RBXScriptSignal.Wait}
---@param func fun(touchPositions:any[],rotation:number,velocity:number,state:UserInputState):void
---@return RBXScriptConnection
function GuiObject.TouchRotate:Connect(func) end

--- Fires when the player performs a swipe gesture on the UI element
---@class __ignore_TouchSwipe__ : RBXScriptSignal
GuiObject.TouchSwipe = {Wait=RBXScriptSignal.Wait}
---@param func fun(swipeDirection:SwipeDirection,numberOfTouches:number):void
---@return RBXScriptConnection
function GuiObject.TouchSwipe:Connect(func) end

--- Fires when the player performs a tap gesture on the UI element
---@class __ignore_TouchTap__ : RBXScriptSignal
GuiObject.TouchTap = {Wait=RBXScriptSignal.Wait}
---@param func fun(touchPositions:any[]):void
---@return RBXScriptConnection
function GuiObject.TouchTap:Connect(func) end