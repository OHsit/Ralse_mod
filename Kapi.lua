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