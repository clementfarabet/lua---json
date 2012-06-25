
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
