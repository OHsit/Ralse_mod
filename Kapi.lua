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
--load seals
local PH_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/seals")
for _, file in ipairs(PH_src) do
    assert(SMODS.load_file("src/seals/" .. file))()
end
--load decks
local PH_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/decks")
for _, file in ipairs(PH_src) do
    assert(SMODS.load_file("src/decks/" .. file))()
end
--load tarot
local PH_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/tarot")
for _, file in ipairs(PH_src) do
    assert(SMODS.load_file("src/tarot/" .. file))()
end
--load skip tags
local PH_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/skiptags")
for _, file in ipairs(PH_src) do
    assert(SMODS.load_file("src/skiptags/" .. file))()
end
--load stakes
local Stakes_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/stakes")
for _,file in ipairs(Stakes_src) do
    assert(SMODS.load_file("src/stakes/" .. file))()
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