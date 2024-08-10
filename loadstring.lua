--[[
	Credit to einsteinK.
	Credit to Stravant for LBI.
	
	Credit to the creators of all the other modules used in this.
	
	Sceleratis was here and decided modify some things.
	
	einsteinK was here again to fix a bug in LBI for if-statements
--]]

local req = (syn and syn.request) or (http and http.request) or http_request

function GetHttp(URL)
	local Data = nil
	local Test = req({
        Url = URL,
        Method = 'GET',
	})
	for i,v in pairs(Test) do
		Data = v
	end
	return loadstring(Data)
end

function package(name)
	return GetHttp("https://raw.githubusercontent.com/Mana42138/custom-loadstring/main/packages/"..name..".lua")
end

local luaX = package("LuaX")()
local luaY = package("LuaY")()
local luaZ = package("LuaZ")()
local luaU = package("LuaU")()
local rerubi = package("Rerubi")()

luaX:init()
local LuaState = {}

getfenv().script = nil

return function(str,env)
	local f,writer,buff,name
	local env = env or getfenv(2)
	local name = (env.script and env.script:GetFullName())
	local ran,error = pcall(function()
		local zio = luaZ:init(luaZ:make_getS(str), nil)
		if not zio then return error() end
		local func = luaY:parser(LuaState, zio, nil, name or "::Adonis::Loadstring::")
		writer, buff = luaU:make_setS()
		luaU:dump(LuaState, func, writer, buff)
		f = rerubi(buff.data, env)
	end)
	
	if ran then
		return f,buff.data
	else
		return nil,error
	end
end
