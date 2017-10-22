--[[
CrazyNotes.lua
==============

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
along with CrazyNote.  If not, see <http://www.gnu.org/licenses/>.

]]
--------------------------------------------------------------------------------

-- Useage: File->Plug-in Extras->CrazyNotes

require 'class'
require 'Notify'

require 'Preferences'
require 'Note'

local catalog = import "LrApplication".activeCatalog()
local LrTasks = import 'LrTasks'

--------------------------------------------------------------------------------------------

local theNote = Note()

LrTasks.startAsyncTask( function()

	local sources = catalog:getActiveSources() 
	local Prefs = Preferences()
	
	for name, source in pairs(sources) do

		Notify():Log( "Path: ", theNote:NotePath( source ))

		theNote:CreateNote( source )
		theNote:EditNote( source, Prefs.CrazyNotesAppPath )

	end
end )



