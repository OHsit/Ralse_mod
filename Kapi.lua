if not Kapi then
    Kapi = {}
end

Ralse = SMODS.current_mod
Ralse_path = SMODS.current_mod.path

--#region SMODS Optional Features Im turing on
Ralse.optional_features = {retrigger_joker = true,post_trigger= true}
--#endregion



--#region crossmods
--tailsman compact
to_big = to_big or function (num)
    return num
end

to_number = to_number or function (num)
    return num
end
--#endregion
--#region load  src stuff
local joker_src = SMODS.NFS.getDirectoryItems(Ralse_path .. "src/jokers")
local ph_src = SMODS.NFS.getDirectoryItems(Ralse_path .. "src/pokerhands")
local blind_src = SMODS.NFS.getDirectoryItems(Ralse_path .. "src/blinds")
local seals_src = SMODS.NFS.getDirectoryItems(Ralse_path .. "src/seals")
local back_src = SMODS.NFS.getDirectoryItems(Ralse_path .. "src/decks")
local sticker_src = SMODS.NFS.getDirectoryItems(Ralse_path .. "src/Stickers")
local spectral_src = SMODS.NFS.getDirectoryItems(Ralse_path .. "src/spectrals")
local encha_src = SMODS.NFS.getDirectoryItems(Ralse_path .. "src/enchancments")
local edition_src = SMODS.NFS.getDirectoryItems(Ralse_path .. "src/editions")
local stakes_src = SMODS.NFS.getDirectoryItems(Ralse_path .. "src/stakes")
local skip_src = SMODS.NFS.getDirectoryItems(Ralse_path .. "src/skiptags")
local tarrot_src = SMODS.NFS.getDirectoryItems(Ralse_path .. "src/tarot")
local prohpecy_src = SMODS.NFS.getDirectoryItems(Ralse_path .. "src/prohpecy")
--doing for loops ahhhhhhh
for _, file in ipairs(joker_src) do
    print("[RALSEMOD] Loading lua file " .. file)
    assert(SMODS.load_file("src/jokers/" .. file))()
end
for _, file in ipairs(ph_src) do
    print("[RALSEMOD] Loading lua file " .. file)
    assert(SMODS.load_file("src/pokerhands/" .. file))()
end
for _, file in ipairs(blind_src) do
    print("[RALSEMOD] Loading lua file " .. file)
    assert(SMODS.load_file("src/blinds/" .. file))()
end
for _, file in ipairs(seals_src) do
    print("[RALSEMOD] Loading lua file " .. file)
    assert(SMODS.load_file("src/seals/" .. file))()
end
for _, file in ipairs(back_src) do
    print("[RALSEMOD] Loading lua file " .. file)
    assert(SMODS.load_file("src/decks/" .. file))()
end
for _, file in ipairs(sticker_src) do
    print("[RALSEMOD] Loading lua file " .. file)
    assert(SMODS.load_file("src/Stickers/" .. file))()
end
for _, file in ipairs(spectral_src) do
    print("[RALSEMOD] Loading lua file " .. file)
    assert(SMODS.load_file("src/spectrals/" .. file))()
end
for _, file in ipairs(encha_src) do
    print("[RALSEMOD] Loading lua file " .. file)
    assert(SMODS.load_file("src/enchancments/" .. file))()
end
for _, file in ipairs(edition_src) do
    print("[RALSEMOD] Loading lua file " .. file)
    assert(SMODS.load_file("src/editions/" .. file))()
end
for _, file in ipairs(stakes_src) do
    print("[RALSEMOD] Loading lua file " .. file)
    assert(SMODS.load_file("src/stakes/" .. file))()
end
for _, file in ipairs(skip_src) do
    print("[RALSEMOD] Loading lua file " .. file)
    assert(SMODS.load_file("src/skiptags/" .. file))()
end
for _, file in ipairs(tarrot_src) do
    print("[RALSEMOD] Loading lua file " .. file)
    assert(SMODS.load_file("src/tarot/" .. file))()
end
for _,file in ipairs(prohpecy_src) do
    print("[RALSEMOD] Loading lua file " .. file)
    assert(SMODS.load_file("src/prohpecy/" .. file))()
end
--#endregion 
--#region lib folder
--Load lib files
local files = NFS.getDirectoryItems(Ralse_path .. "libs/")
for _, file in ipairs(files) do
	print("[RALSEMOD] Loading lib file " .. file)
	local f, err = SMODS.load_file("libs/" .. file)
	if err then
		error(err) 
	end
	f()
end
--#endregion
--#region locals
--Load Localization file
local files = NFS.getDirectoryItems(Ralse_path .. "localization")
for _, file in ipairs(files) do
	print("[RALSEMOD] Loading localization file " .. file)
	local f, err = SMODS.load_file("localization/" .. file)
	if err then
		error(err) 
	end
	f()
end
--#endregion

--#region mod pool
SMODS.ObjectType({
    key = "Ralseaddtiton",
    default = "j_reserved_parking",
    cards = {},
    injcet = function (self)
        SMODS.ObjectType.injcet(self)
    end,
})
--#endregion