function Card:has_stickers()
    for i,v in pairs(SMODS.Sticker.obj_table) do
        if self.ability then
            return true
        end
    end
end

function Kapi.is_number(x)
    return type(x) == "number" or (type(x) == "table" and is_number(x)) or (is_big and is_big(x))
end

function Kapi.is_big(x)
    return (type(x) == "table"and is_number(x)) or (is_big and is_big(x))
end
--stealing for rofflatro why not
Kapi = {}
Kapi.Read = {}

---@param table_in table|Card
---@param config table
function Kapi.mod_joker_values(table_in, config)
    if not config then config = {} end
    local add = config.add or 0
    local mult_value = config.mult_value or 1
    local keywords = config.keywords or {}
    local unkeywords = config.unkeywords or {}
    local x_protect = config.x_protect or true
    local ref = config.ref or table_in
    local function modify_values(table_in,ref)
        for k,v in pairs(table_in) do
            if type(v) == "number" then
                if(keywords[k] or (Kapi.Read.true_table_size(keywords) < 1)) and not unkeywords[k] then
                    if ref and ref[k] then
                        if not (x_protect and (Kapi.Read.It_starts_with(k,"x_")or Kapi.Read.It_starts_with(k,"h_x_"))and ref[k] ==1) then
                            table_in[k] = (ref[k] + add) * mult_value
                        end
                    end
                end 
                elseif type(v) == "table" then
                    modify_values(v,ref[k])
            end
        end
    end
    if table_in == nil then
        return
    end
    modify_values(table_in,ref)
end

---@param table table
---@return number
function Kapi.Read.true_table_size(table)
    local n = 0
    for k,v in pairs(table) do
        n = n+1
    end
    return n
end

--- @param card table|Card
--- @param mult number
function Kapi.xmult_playing_card(card, mult)
    local table_in = {
        nominal = card.base.nominal,
        ability = card.ability
    }
    Kapi.mod_joker_values(table_in,{mult_value = mult})
    card.base.nominal = table_in.nominal
    card.ability = table_in.ability
end

---@param str string
---@param start string
---@return boolean
function Kapi.Read.It_starts_with(str, start) --one day i dont know why
    return str:sub(1, #start) == start
end


---@param table table
---@param value any
---@return boolean
function Kapi.Read.table_contains(table, value)
    for i = 1,#table do
        if (table[i]== value) then
            return true
        end
    end
    return false
end