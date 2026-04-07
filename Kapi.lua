--load jokers
local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")
for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end
--load poker hands
local PH_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/pokerhands")
for _, file in ipairs(PH_src) do
    assert(SMODS.load_file("src/pokerhands/" .. file))()
end
--load blinds
local PH_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/blinds")
for _, file in ipairs(PH_src) do
    assert(SMODS.load_file("src/blinds/" .. file))()
end


--Ralse mod pool
SMODS.ObjectType({
    key = "Ralseaddtiton",
    default = "j_reserved_parking",
    cards = {},
    injcet = function (self)
        SMODS.ObjectType.injcet(self)
    end,
})

--Food pool for czupa :3
SMODS.ObjectType({
    key = "Food",
    default = "j_egg",
    cards = {},
    injcet = function (self)
        self:inject_card(G.P_CENTERS.j_egg)
        self:inject_card(G.P_CENTERS.j_popcorn)
        self:inject_card(G.P_CENTERS.j_gros_michel)
        self:inject_card(G.P_CENTERS.j_ice_cream)
        self:inject_card(G.P_CENTERS.j_cavendish)
        self:inject_card(G.P_CENTERS.j_ramen)
        self:inject_card(G.P_CENTERS.j_turtle_bean)
    end
})