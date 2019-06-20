from urllib.request import urlopen
from bs4 import BeautifulSoup, Tag
from typing import List
from enumListToEmmy import getEnums
import os
import re


# Class used for config
class ClassItem:
	def __init__(self, className: str, additionalFeatures: str=None, inherit: str=None):
		self.className = className
		self.additionalFeatures = additionalFeatures
		self.inherit = inherit


# Config Stuff
dataModelAddFea = """
-- ServiceProvider Patch --
---@param className '"HttpRbxApiService"'|'"NotificationService"'|'"GuiService"'|'"UserInputService"'|'"HttpService"'|'"RunService"'|'"TestService"'|'"PathfindingService"'|'"AnalyticsService"'|'"FlyweightService"'|'"CSGDictionaryService"'|'"NonReplicatedCSGDictionaryService"'|'"LoginService"'|'"ThirdPartyUserService"'|'"TouchInputService"'|'"RuntimeScriptService"'|'"GuidRegistryService"'|'"PhysicsService"'|'"AdService"'|'"TextService"'|'"MarketplaceService"'|'"TeleportService"'|'"GamePassService"'|'"AssetService"'|'"InsertService"'|'"PointsService"'|'"ChangeHistoryService"'|'"ServerScriptService"'|'"JointsService"'|'"LogService"'|'"LocalizationService"'|'"ControllerService"'|'"ServiceProvider"'|'"LuaWebService"'|'"ScriptService"'|'"FlagStandService"'|'"SpawnerService"'|'"TimerService"'|'"CookiesService"'|'"GroupService"'|'"CollectionService"'|'"TweenService"'|'"ContextActionService"'|'"SoundService"'|'"VRService"'|'"PluginGuiService"'|'"BadgeService"'|'"DataStoreService"'|'"HapticService"'|'"FriendService"'|'"GamepadService"'
---@return Instance
function {name}:GetService(className) end
---@param className '"HttpRbxApiService"'|'"NotificationService"'|'"GuiService"'|'"UserInputService"'|'"HttpService"'|'"RunService"'|'"TestService"'|'"PathfindingService"'|'"AnalyticsService"'|'"FlyweightService"'|'"CSGDictionaryService"'|'"NonReplicatedCSGDictionaryService"'|'"LoginService"'|'"ThirdPartyUserService"'|'"TouchInputService"'|'"RuntimeScriptService"'|'"GuidRegistryService"'|'"PhysicsService"'|'"AdService"'|'"TextService"'|'"MarketplaceService"'|'"TeleportService"'|'"GamePassService"'|'"AssetService"'|'"InsertService"'|'"PointsService"'|'"ChangeHistoryService"'|'"ServerScriptService"'|'"JointsService"'|'"LogService"'|'"LocalizationService"'|'"ControllerService"'|'"ServiceProvider"'|'"LuaWebService"'|'"ScriptService"'|'"FlagStandService"'|'"SpawnerService"'|'"TimerService"'|'"CookiesService"'|'"GroupService"'|'"CollectionService"'|'"TweenService"'|'"ContextActionService"'|'"SoundService"'|'"VRService"'|'"PluginGuiService"'|'"BadgeService"'|'"DataStoreService"'|'"HapticService"'|'"FriendService"'|'"GamepadService"'
---@return Instance
function {name}:FindService(className) end

-- Global Variable Name Patch --
---@type {name}
game = nil
""".strip()


classList = [
	# ClassItem("Instance"),

	# ClassItem("DataModel", dataModelAddFea),
	# ClassItem("Workspace"),

	# ClassItem("LocalizationTable"),

	# ClassItem("GuiBase2d"),
	# ClassItem("GuiObject", inherit="GuiBase2d"),
	# ClassItem("GuiButton", inherit="GuiObject"),
	# ClassItem("ImageButton", inherit="GuiButton"),
	# ClassItem("TextButton", inherit="GuiButton"),
	ClassItem("GuiLabel", inherit="GuiObject"),
	ClassItem("TextLabel", inherit="GuiLabel"),
	ClassItem("ImageLabel", inherit="GuiLabel"),
]


# Config (no change's needed probs)
mainSectionReg = re.compile("(?:a|[^a])*<div class=\"page-section-content\">((?:a|[^a])*)<div class=\"prev-next-wrap\">")
nameReg = re.compile("(?:a|[^a])*<h1 data-toc-skip>(.*?)</h1>")
descReg = re.compile("(?:a|[^a])*<div class=\"markdown-field-data\">((?:a|[^a])*)<div class=\"page-section-content\">")
luaKeywordsReg = re.compile("and|break|do|else|elseif|end|false|for|function|if|in|local|nil|not|or|repeat|return|then|true|until|while")


# Code
class Argument:
	def __init__(self, name: str, _type: str):
		self.name = name if luaKeywordsReg.match(name) is None else "_"+name
		self.type = _type


class Property:
	def __init__(self, name: str, desc: str, _type: str, tags: List[str]):
		self.name = name
		self.desc = desc
		self.type = _type
		self.tags = tags


class Function:
	def __init__(self, name: str, desc: str, arguments: List[Argument], returnType: str, tags: List[str]):
		self.name = name
		self.desc = desc
		self.arguments = arguments
		self.returnType = returnType
		self.tags = tags


class Event:
	def __init__(self, name: str, desc: str, arguments: List[Argument], tags: List[str]):
		self.name = name
		self.desc = desc
		self.arguments = arguments
		self.tags = tags


class PageParser:
	def __init__(self, htmlCode: str):
		self.properties: List[Property] = []
		self.functions: List[Function] = []
		self.events: List[Event] = []
		self.inherits: List[str] = []

		self.name = nameReg.match(htmlCode)
		if self.name is None:
			raise SyntaxError("Failed to match name of data with `nameReg`.")
		self.name = self.name.groups()[0]

		self.desc = descReg.match(htmlCode)
		if self.desc is None:
			print("WARNING: failed to get description for class with `descReg`.")
			self.desc = "Failed to retrieve description."
		else:
			self.desc = BeautifulSoup(self.desc.groups()[0], "lxml").get_text()

		htmlMatch = mainSectionReg.match(htmlCode)
		if htmlMatch is None:
			raise SyntaxError("Failed to match section of html code with `mainSectionReg`")
		for s in htmlMatch.groups():
			if s is not None and len(s) > 0:
				htmlCode = s
		soup = BeautifulSoup(htmlCode, "lxml")
		body = None
		for child in soup.children:
			if isinstance(child, Tag):
				body = child.body
				break
		if body is None:
			raise SyntaxError("Failed to get body from html.")

		properties = body.findChild(attrs={"id": "properties"}, recursive=False)
		if properties is not None:
			self.parseProperties(properties)
		else:
			print("No properties.")
		constructors = body.findChild(attrs={"id": "constructors"}, recursive=False)
		if constructors is not None:
			self.parseFunctions(constructors)
		else:
			print("No constructors.")
		functions = body.findChild(attrs={"id": "functions"}, recursive=False)
		if functions is not None:
			self.parseFunctions(functions)
		else:
			print("No functions.")
		events = body.findChild(attrs={"id": "events"}, recursive=False)
		if events is not None:
			self.parseEvents(events)
		else:
			print("No events.")

	@staticmethod
	def parseDesc(desc: Tag):
		return desc.get_text().strip()

	def parseProperties(self, properties: Tag):
		for child in properties.findAll(attrs={"class": "table tbl-items"}, recursive=False):
			data = child.tbody.tr.td
			desc = self.parseDesc(child.tbody.tr.find(attrs={"class": "description"}, recursive=False))
			name = data.find(attrs={"class": "name"}).get_text().strip()
			_type = data.find(attrs={"class": "type"}).get_text().strip()
			tags = [span.span.get_text().strip() for span in data.findAll(attrs={"class": "api-tag"})]
			self.properties.append(Property(
				name, desc, _type, tags
			))
		for child in properties.findAll(attrs={"class": "inherited-lbl"}):
			inheritName = child.strong.a.get_text()
			if inheritName not in self.inherits:
				self.inherits.append(inheritName)

	def parseFunctions(self, functions: Tag):
		for child in functions.findAll(attrs={"class": "table tbl-items"}, recursive=False):
			data = child.tbody.tr.td
			desc = self.parseDesc(child.tbody.tr.find(attrs={"class": "description"}, recursive=False))
			# dataName is data under the the html element with class `name`
			dataName = data.find(attrs={"class": "name"}).h3
			name = dataName.a.get_text().strip()
			arguments = [
				Argument(
					span.find(attrs={"class": "value"}).get_text().strip(),
					span.find(attrs={"class": "type"}).get_text().strip()
				) for span in dataName.span.findAll(attrs={"class": "argument"})
			]
			returnType = data.find(attrs={"class": "type"}).get_text().strip()
			tags = [span.span.get_text().strip() for span in data.findAll(attrs={"class": "api-tag"})]
			self.functions.append(Function(
				name, desc, arguments, returnType, tags
			))
		for child in functions.findAll(attrs={"class": "inherited-lbl"}):
			inheritName = child.strong.a.get_text()
			if inheritName not in self.inherits:
				self.inherits.append(inheritName)

	def parseEvents(self, events: Tag):
		for child in events.findAll(attrs={"class": "table tbl-items"}, recursive=False):
			data = child.tbody.tr.td
			desc = self.parseDesc(child.tbody.tr.find(attrs={"class": "description"}, recursive=False))
			# dataName is data under the the html element with class `name`
			dataName = data.find(attrs={"class": "name"}).h3
			name = dataName.a.get_text().strip()
			arguments = [
				Argument(
					span.find(attrs={"class": "value"}).get_text().strip(),
					span.find(attrs={"class": "type"}).get_text().strip()
				) for span in dataName.span.findAll(attrs={"class": "argument"})
			]
			tags = [span.span.get_text().strip() for span in data.findAll(attrs={"class": "api-tag"})]
			self.events.append(Event(
				name, desc, arguments, tags
			))
		for child in events.findAll(attrs={"class": "inherited-lbl"}):
			inheritName = child.strong.a.get_text()
			if inheritName not in self.inherits:
				self.inherits.append(inheritName)

	@staticmethod
	def convertType(typeName: str):
		checkTypeName = typeName.lower().strip()
		if checkTypeName in ("number", "int", "int32", "int64", "float", "double"):
			return "number"
		elif checkTypeName == "string":
			return "string"
		elif checkTypeName in ("boolean", "bool"):
			return "boolean"
		elif checkTypeName == "table":
			return "table"
		elif checkTypeName == "function":
			return "function"
		elif checkTypeName in ("array", "tuple"):
			return "any[]"
		elif checkTypeName == "objects":
			return "Instance[]"
		elif checkTypeName == "content":
			return "string @ RealSignature ContentString"  # MOTE: this might not be the best
		elif checkTypeName == "void":
			return "void"
		elif checkTypeName == "nil":
			return "nil"
		elif checkTypeName == "variant":
			return "any"
		elif typeName in enums.keys():
			return typeName
		elif typeName in classes:
			return typeName
		else:
			print(f"WARNING: unhandled type '{typeName}'")
			return typeName

	def lua(self, additionalFeatures: str=None):
		if len(self.inherits) > 1:
			print(f"WARNING: Multiple Inheritance is not supported in EmmyLua {self.inherits} using first item.")
		descStr = "\n".join([
			f"--- {line}" for line in self.desc.splitlines()
		])
		propertiesCode = ",\n\t".join([
			("\n\t".join([f"--- {line}" for line in prop.desc.splitlines()]) + "\n\t" if len(prop.desc.splitlines()) > 0 else "") +
			(f'--- Tags: {", ".join(prop.tags)}' + "\n\t" if len(prop.tags) > 0 else "") +
			f"---@type {self.convertType(prop.type)}\n\t"
			f"{prop.name}=nil" for prop in self.properties
		])
		functionsCode = "\n\n".join([
			("\n".join([f"--- {line}" for line in func.desc.splitlines()]) + "\n" if len(func.desc.splitlines()) > 0 else "") +
			(f'--- Tags: {", ".join(func.tags)}' + "\n\t" if len(func.tags) > 0 else "") +
			("\n".join([f"---@param {arg.name} {self.convertType(arg.type)}" for arg in func.arguments]) + "\n" if len(func.arguments) > 0 else "") +
			f"---@return {self.convertType(func.returnType)}\n"
			f"function {self.name}:{func.name}({', '.join([f'{arg.name}' for arg in func.arguments])}) end"
			for func in self.functions
		])
		eventsCode = "\n\n".join([
			("\n".join([f"--- {line}" for line in event.desc.splitlines()]) + "\n" if len(event.desc.splitlines()) > 0 else "") +
			(f'--- Tags: {", ".join(event.tags)}' + "\n\t" if len(event.tags) > 0 else "") +
			f"---@class __ignore_{event.name}__ : RBXScriptSignal\n"
			f"{self.name}.{event.name} = {{Wait=RBXScriptSignal.Wait}}\n"
			f"---@param func fun({','.join([f'{arg.name}:{self.convertType(arg.type)}' for arg in event.arguments])}):void\n"
			#f"---@param func function\n"
			f"---@return RBXScriptConnection\n"
			f"function {self.name}.{event.name}:Connect(func) end"
			for event in self.events
		])
		additionalFeaturesStr = ""
		if additionalFeatures is not None:
			additionalFeaturesStr = f"-- Additional Features --\n{additionalFeatures.format(name=self.name)}"
		return f"""
-- Generated by {os.path.basename(__file__)}

{descStr}
---@class {self.name}{f" : {self.inherits[0]}" if len(self.inherits) > 0 else ""}
{self.name} = {{
	-- Properties --
	{propertiesCode}
}}

-- Functions --
{functionsCode}

-- Events --
{eventsCode}

{additionalFeaturesStr}""".strip()


def convertHtml(pageHtml: str, classItem: ClassItem):
	pageParser = PageParser(pageHtml)
	if classItem.inherit is not None:
		pageParser.inherits.insert(0, classItem.inherit)
	luaCode = pageParser.lua(classItem.additionalFeatures)
	with open(f"api/{pageParser.name}.lua", "w") as f:
		f.write(luaCode)


if __name__ == "__main__":
	enums = getEnums()
	classes = [fileName[:-4] for fileName in os.listdir("api/")]
	for _classItem in classList:
		classes.append(_classItem.className)
		print(f"Getting page and Parsing '{_classItem.className}'")
		convertHtml(
			urlopen(rf"https://developer.roblox.com/api-reference/class/{_classItem.className}").read().decode(),
			_classItem
		)
