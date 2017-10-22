
local LrLogger = import 'LrLogger'

require 'utils'

Notify = class( function( __ ) 
	
	__.Logger = LrLogger( "KA_Log" )
	__.Logger:enable( "print" )     -- to console. use traceback to print with trace to console.
									-- look under local device for output.

	__.ErrorLogger = LrLogger( "KA_ErrorLog" )                       

end )

-- Log to console (MacOS)
function Notify:Log( ... )

	self.Logger:debug( "Log: " .. self:ArgsToString( {...} ) )

end

function Notify:ArgsToString( argList )
	
	local s = ""
	for i,v in pairs( argList ) do
		s = s .. " " .. self:TableToString( v, false, true, false  )
	end
	return s

end
function Notify:TableToString( val, name, skipnewlines, brackets, depth )
	
	depth = depth or 0

	local tmp = string.rep("   ", depth)

	if name then tmp = tmp .. name .. " = " end

	if type(val) == "table" then
	
		tmp = tmp .. ( brackets and "{" or "" ) .. (not skipnewlines and "\n" or "")

		for key, value in pairs(val) do
			tmp =  tmp .. Utils:TableToString(value, key, skipnewlines, brackets, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
		end

		tmp = tmp .. ( brackets and (string.rep("  ", depth) .. "}") or "" )
		
	elseif type(val) == "number" then
		tmp = tmp .. tostring(val)
	elseif type(val) == "string" then
		tmp = tmp .. " " .. val --string.format("%q", val)
	elseif type(val) == "boolean" then
		tmp = tmp .. (val and "true" or "false")
	else
		tmp = tmp .. "\"[Unknown datatype:" .. type(val) .. "]\""
	end

	return tmp

end 
	