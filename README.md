# json: a package to handle json (read and write).

TAKEN From JSON4Lua, originally written for Lua 5.1.

Wrapped for Torch7 (torch-pkg) by Clement Farabet.

JSON4Lua: JSON encoding / decoding support for the Lua language.
json Module.

Author: Craig Mason-Jones
Homepage: http://json.luaforge.net/
Version: 0.9.40
This module is released under the MIT License (MIT).

## Install:

First install Torch7 (www.torch.ch) then simply install this package
using torch-pkg:

```
torch-pkg deploy
```

## Usage:

This module exposes 4 functions:

json_string = encode(o)
  Returns the table / string / boolean / number / nil / json.null value as a JSON-encoded string.
o = decode(json_string)
  Returns a Lua object populated with the data encoded in the JSON string json_string.

save(json_file, o)
  Saves the table / string / boolean / number / nil / json.null value as a JSON-encoded file.
o = load(json_file)
  Returns a Lua object populated with the data encoded in the JSON file.

