local modkey = "Pidor"
local hui = {
    {modkey, "Shift", "Left"},
    {modkey, "Alt", "Right"},
    {modkey, "", "Up"},
}

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

 print(dump(hui))