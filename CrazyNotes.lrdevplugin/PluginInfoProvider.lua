--[[
PlugingInfoProvider.lua
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
along with CrazyNotes. If not, see <http://www.gnu.org/licenses/>.
]]

--local Require = require 'Require'.path ("../debugscript.lrdevplugin", "../lib")
--Debug = require 'Debug'.init ()

-- need these if the plugin isn't running.
require 'class'
require 'Notify'
require "Preferences"


local LrView = import 'LrView'
local LrDialogs = import 'LrDialogs'
local LrPrefs = import 'LrPrefs'

local bind = LrView.bind
local share = LrView.share

local pluginInfoProvider = {}

-- button: use LrDialogs.runOpenPanel
function pluginInfoProvider.sectionsForTopOfDialog( f, propertyTable )

	local bind = LrView.bind

	return {
		{
			title = "CrazyNotes",

			synopsis = "CrazyNotes Plugin by Kim Aldis", 
			bind_to_object = propertyTable,
			
			f:row {
				f:group_box {
					height = 150,
					title = "CrazyNotes",
					--EntryBox( f, 'CrazyNotes App Path', 'CrazyNotesAppPath', 300 ),
					f:row {
						fill_horizontal = true,
						f:static_text {
							title = 'CrazyNotes App Path', 
							alignment = 'right',
							width = share 'labelWidth'
						},
				
						f:edit_field {
							value = bind( 'CrazyNotesAppPath' ),
							width = 300
						},
						f:push_button {
							title = "Browse",
							action = function() 

								Notify:Log( "press" )
								local AppPath = LrDialogs.runOpenPanel( {
									title = "Browse for Application",
									prompt = "Use",
									canChooseDirectories = false,
									canCreateDirectories = false,
									allowsMultipleSelection = false,
									fileTypes = "app",
									initialDirectory = "/Applications",
								})
								if AppPath ~= nil then
									propertyTable.CrazyNotesAppPath = AppPath[1]
								end

							end,
						}
						
					}
				}


			}

		}
	}
	
end

function pluginInfoProvider.startDialog( propertyTable )

	local prefs = Preferences()
	prefs:Fetch( propertyTable )
	prefs:addObservers( propertyTable, function( properties, key, newValue ) Notify:Log( "update", key, newValue ) end )

end

function pluginInfoProvider.endDialog( propertyTable )

	local prefs = Preferences()
	prefs:Store( propertyTable )

end

return pluginInfoProvider
