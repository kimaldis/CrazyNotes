--[[
Note.lua
========
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

--------------------------------------------------------------------------------

Note class. 

Handles notes creation, editing and viewing on Lightroom sources.

	Note Storage:

		Notes are just .md (markdown) text files.

		In order to avoid filename collision and issues with source renaming or, 
		in the case of folders, moving, notes are stored:

		* Folders: CrazyNote.md in the folder root
		* Other Sources - collections, etc: In <catalogPath>.CrazyNotes/<source.localIdentifier>.md

------------------------------------------------------------------------------------------------------
]]

local LrFileUtils = import 'LrFileUtils'
local LrPathUtils = import 'LrPathUtils'
local LrShell = import "LrShell"

local catalog = import "LrApplication".activeCatalog()

Note = class( function( __ ) 
	
	local dirPath = LrPathUtils.parent( catalog:getPath() )
	local sName =   LrPathUtils.removeExtension( LrPathUtils.leafName( catalog:getPath() ) )
	
	__.RootPath = dirPath .. "/" .. sName .. ".CrazyNotes"	-- where we keep notes

	-- create the CrazyNotes root directory if it's not there yet
	-- in <catlognameWithoutExtension>.CrazyNotes next to this catalog
	if LrFileUtils.exists( __.RootPath) == false then
		Notify:Bezel( "Creating CrazyNotes Root Dir at " .. __.RootPath )
		LrFileUtils.createDirectory( __.RootPath )
	end

end)

--[[
	Create a path to a note using 'source'. 
	=======================================
	Note doesn't have to exist, it's up to the caller to create one ( Note:CreateNote( source ) ) if needed.
	This just constructs a path
]]
function Note:NotePath( source ) 

	if source:type() == 'LrFolder' then
		return source:getPath() .. "/CrazyNote.md"
	else
		-- use source local identifier
		return self.RootPath .. "/" .. source.localIdentifier .. ".md"
	end
end
--[[
	Create a note at Note:NotePath( source )
	========================================
	If it doesn't already exist

]]
function Note:CreateNote( source ) -- create the note if it doesn't exist. Returns path to note

	local fileName = self:NotePath( source ) 

	if LrFileUtils.exists( fileName ) == false then -- create the note

		--LrFileUtils.createAllDirectories( LrPathUtils.parent( fileName ))
		local file = io.open( fileName, "w" )
		file:write( "# " .. source:getName() .. "\n" )
		file:close()
	
	end
	return fileName
end
--[[
	Edit the Note at Note:NotePath()
	================================
	Using appPath
]]
function Note:EditNote( source, appPath ) 

	local fileName = self:NotePath( source )
	LrShell.openFilesInApp( {fileName}, appPath )

end