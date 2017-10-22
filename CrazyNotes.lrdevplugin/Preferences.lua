--[[
Preferences.lua
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

local LrPrefs = import "LrPrefs"

Preferences = class( function( __ )

	__.Prefs = LrPrefs.prefsForPlugin()

	__.Defaults =  {
		CrazyNotesAppPath = '/Applications/Typora.app'
	}

	-- store default values in  prefs if they  don't exist yet
	for key, value in pairs( __.Defaults ) do
		if __.Prefs[key] == nil then
			Notify:Log( "Storing default", key, value)
			__.Prefs[key] = value
		end
		__[key] = __.Prefs[key]
	end


end )
-- function Keyword:AddToSelectedPhotos() --{{{

-- fetch pref values into theTable
function Preferences:Fetch( theTable )

	for key, value in pairs( self.Defaults ) do
		theTable[key] = self.Prefs[key]
	end

end

-- put values from theTable into prefs
function Preferences:Store( theTable )

	for key, value in pairs( self.Defaults ) do
		self.Prefs[key] = theTable[key]
	end

end

-- add observer
function Preferences:addObservers( theTable, fn ) 
	
	for key, value in pairs( self.Defaults ) do
		theTable:addObserver( key, fn )
	end
end