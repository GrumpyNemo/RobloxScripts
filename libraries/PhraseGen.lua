--[[
Implementation of Tracery in Lua
See source: https://github.com/DeltaF1/lua-tracery
Based off the original work of Tracery by GalaxyKate in https://tracery.io/
]]

local expand
local GenerateString

-- Modifer code ported from [Tracery](https://github.com/galaxykate/tracery) © Kate Compton 2015
local function isVowel(text)
	text = text:lower()
	return text == "a" or
		text == "e" or
		text == "i" or
		text == "o" or
		text == "u"
end

local modifiers = {
	capitalize = function(text)
		return text:sub(1,1):upper()..text:sub(2)
	end,
	capitalizeAll = function(text)
		return (" "..text):gsub(" (%w)", function(char) return " "..char:upper() end):sub(2)
	end,
	a = function(text)
		local lower = text:lower()
		if isVowel(lower:sub(1,1)) and not (lower:sub(1,1) == "u" and lower:sub(3,3) == "i") then
			return "an "..text
		end
		return "a "..text
	end,
	s = function(text)
		local last = text:sub(-1,-1):lower()
		if last == "s" or last == "h" or last == "x" then
			return text.."es"
		elseif last == "y" then
			if not isVowel(text:sub(-2,-2)) then
				return text:sub(1,-2).."ies"
			end
		end
		return text.."s"
	end,
	lower = string.lower,
	upper = string.upper,
}

function GenerateString(symbol, context)
	local rule = context[symbol]

	local localContext = {}
	setmetatable(localContext, {__index = context})

	-- Return the expanded string and the (potentially) modified context
	local expanded = expand(rule, localContext)
	if expanded == nil then
		expanded = "(("..symbol.."))"
	end
	return expanded, localContext
end

function expand(rule, context)
	local localContext = {}
	setmetatable(localContext, {__index = context})

	if type(rule) == "table" then
		rule = rule[math.random(#rule)]
	elseif type(rule) == "function" then
		rule = tostring(rule())
	elseif rule == nil then
		return nil
	end

	-- Keep track of where in the text we are
	local pointer = 0
	while true do
		-- Hack to get around pattern matching restrictions

		-- Find the locations of rules and actions

		-- Use a call to string:sub instead of passing pointer to the find call so we can
		-- take advantage of the "start of string" operator in pattern matching
		local offsetrule = rule:sub(pointer+1)
		local a, b, c, d
		a,b = offsetrule:find("^#.-[^\\]#")
		if a == nil then
			a,b = offsetrule:find("[^\\]#.-[^\\]#")
			-- offset a since we're matching the non \ character
			if a then a = a + 1 end
		end
		c, d = offsetrule:find("%[.-%]")

		-- Keep track of the area we are evaluating
		local istart, iend

		-- Find the earliest pair of istart,iend and assign them
		if (c == nil) or (a and c and a < c) then
			istart, iend = a,b
		else
			istart, iend = c,d
		end
		if istart == nil then
			break
		end

		istart,iend = istart+pointer,iend+pointer

		local token = rule:sub(istart, iend)

		local replacement

		if token:sub(1,1) == "#" then
			-- It's a rule

			-- Strip out the "#" characters
			local stripped = token:sub(2,-2)

			-- Pull out any modifiers
			local parts = {}
			for part in (stripped.."."):gmatch("(.-)%.") do
				table.insert(parts, part)
			end

			stripped = parts[1]

			-- GenerateString text from the symbol
			local _context
			replacement, _context = GenerateString(stripped, localContext)

			-- If any actions were performed as a result of this generation
			-- apply them to the current context
			for k,v in pairs(_context) do localContext[k] = v end

			-- Iterate over the modifiers and apply them to the GenerateStringd text
			for i = 2,#parts do
				local f = modifiers[parts[i]]
				if not f then
					print("unknown modifier \""..parts[i].."\"")
					f = function(text) return text end
				end
				replacement = f(replacement)
			end
		elseif token:sub(1,1) == "[" then
			-- It's an action
			name, value = token:match("%[(.-):(.-)%]")
			if value == "POP" then
				localContext[name] = nil
			else
				localContext[name] = expand(value, localContext)
			end

			-- Actions evaluate to empty text
			replacement = ""
		end

		-- Replace the area where the token was (istart -> iend) with 
		-- the replacement text GenerateStringd from the previous step
		rule = rule:sub(1, istart-1)..replacement..rule:sub(iend+1)

		-- Calculate the new "iend" position based on how much the text was shifted
		-- by replacement
		local diff = #replacement - #token

		pointer = iend + diff
	end

	-- If there are any actions which were not explicitly POP'd
	-- then propagate them up the call-stack to apply to future generations
	for k,v in pairs(localContext) do
		context[k] = v
	end

	rule = rule:gsub("\\#", "#")

	return rule
end

-- TODO: Make this actually use a class pattern?
function CreateGrammar(grammar)
	-- Create a proxy context to add overriding rules to
	local context
	if grammar then
		context = setmetatable({}, {__index=grammar})
	else
		context = {}
	end

	return {
		GenerateString = function(symbol)
			symbol = symbol or "origin"
			return GenerateString(symbol, context)
		end,
		addRule = function(symbol, value)
			context[symbol] = value
		end,
		delRule = function(symbol)
			context[symbol] = nil
		end,
		pushContext = function(_context)
			context = setmetatable(_context, {__index=context})
		end,
		popContext = function()
			context = getmetatable(context).__index
		end
	}
end

local TextGenerator = {}

-- DICTIONARY. Used to store all the possible phrases and words used.
local adDictionary = {
	-- Origin: The starting point of every random text. Picks one of these phrases seperated by commas.
	origin = {"#phraseExclaim#", "#phraseDemand#"},
	-- Phrases that can be used
	phraseExclaim = "#verb.capitalize# our #productAdjective# #noun.s# #timeCommand#!",
	phraseDemand = "You #verbCommand# #noun.s# in your #emotionAdjective# life #timeCommand#!",

	-- General purpose words for any phrase. Used between all phrases. 
	productAdjective = {"hot", "brand-new", "redesigned", "upgraded", "chic", "modern", "colorful", "hipster", "new-fangled"},
	emotionAdjective = {"sad", "miserable", "sorrow-filled", "empty"},
	verbCommand = {"need", "miss", "lack" },
	verb = {"taste", "fear", "adore", "eat", "buy", "consume", "steal"},
	noun = {"pineapple", "body lotion", "teddy bear", "pizza", "duck", "paper"},
	timeCommand = {"right now", " today", "this instant", "forever", "now"}
}

-- GRAMMAR. Created to specifically create information for an advertisement. 
local adGrammarObject = CreateGrammar(adDictionary)
-- In case you want to use more than one grammar and make this more modular. 
local grammarDatabase = {
	adGrammar = adGrammarObject,
}

-- In case you want to use different grammars, pass in the name of the one from the dictionary.
local function FetchGrammar(whichGrammarName)
	return grammarDatabase[whichGrammarName]
end

function TextGenerator.GetPhrase(player, whichGrammar)
	local grammar = FetchGrammar(whichGrammar)
	local phrase = grammar.GenerateString("origin")
	return phrase
end



return TextGenerator
