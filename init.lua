-----------------------------------------------------------------------------
-- TAKEN From JSON4Lua, originally written for Lua 5.1
-- Wrapped for torch-pkg (Clement Farabet)
--
-- JSON4Lua: JSON encoding / decoding support for the Lua language.
-- json Module.
-- Author: Craig Mason-Jones
-- Homepage: http://json.luaforge.net/
-- Version: 0.9.40
-- This module is released under the MIT License (MIT).

-- USAGE:
-- This module exposes 4 functions:
--   json_string = encode(o)
--     Returns the table / string / boolean / number / nil / json.null value as a JSON-encoded string.
--   o = decode(json_string)
--     Returns a Lua object populated with the data encoded in the JSON string json_string.
--
--   save(json_file, o)
--     Saves the table / string / boolean / number / nil / json.null value as a JSON-encoded file.
--   o = load(json_file)
--     Returns a Lua object populated with the data encoded in the JSON file.
-----------------------------------------------------------------------------

require 'dok'

json = {}

torch.include('json', 'json.lua')

function json.load(...)
   local _, path = dok.unpack(
      {...},
      'json.load',
      'Load a JSON file',
      {arg='path', type='string', help='path to file', req=true}
   )
   path = path:gsub('^~',os.getenv('HOME'))
   local f = io.open(path,'r')
   local js = f:read('*all')
   f:close()
   local tb = json.decode(js)
   return tb
end

function json.save(...)
   local _, path, tb = dok.unpack(
      {...},
      'json.save',
      'Save a table to a JSON file',
      {arg='path', type='string', help='path to file', req=true},
      {arg='table', type='table', help='table to save', req=true}
   )
   path = path:gsub('^~',os.getenv('HOME'))
   local js = json.encode(tb)
   local f = io.open(path,'w')
   f:write(js)
   f:close()
end
