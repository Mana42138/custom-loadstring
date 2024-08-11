loadstring.lua

has all of the code combined and fixed all you need to do is use the '_gplau' function

```lua
-- > loadstring code above < --
function _gplau(str, env)
    local f, writer, buff, name
    env = env or getfenv(2)  -- Use the provided environment or get the calling environment
    name = "Mana_"

    local ran, error = pcall(function()
        -- Process the multi-line string as it is
        local zio = luaZ:init(luaZ:make_getS(str), nil)
        if not zio then return error() end
        local func = luaY:parser(LuaState, zio, nil, name or "::Adonis::Loadstring::")
        writer, buff = luaU:make_setS()
        luaU:dump(LuaState, func, writer, buff)
        f = rerubi:wrappermix(buff.data, env)
    end)
    
    if ran then
        return f, buff.data
    else
        return nil, error
    end
end

_gplau('print("Hello world!")')()
```
