--[[
info.lua
=======================
	
This file is part of CrazyNotes - Lightroom plugin.
Copyright(c) 2017, Kim Aldis
	
CrazyNotes is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
CrazyNotes is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with CrazyNote. If not, see <http://www.gnu.org/licenses/>.
]]


local sPluginName = 'CrazyNotes' 
return {
	
	LrSdkVersion = 5.0,
	LrSdkMinimumVersion = 1.3, -- minimum SDK version required by this plug-in



	LrToolkitIdentifier = 'com.kim-aldis.import.' .. sPluginName,

	LrPluginName = LOC "$$$/" .. sPluginName .. "/PluginName=" .. sPluginName .. " by Kim Aldis",
	
	-- Add the menu item to the File menu.
	LrExportMenuItems = {
		title = sPluginName,
		file = sPluginName .. ".lua",
	},

	LrPluginInfoProvider = "PluginInfoProvider.lua",
	
}


	
