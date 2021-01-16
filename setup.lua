function download(file)
  print("downloading " .. file)
  fs.delete(file)
  local content = http.get("https://raw.githubusercontent.com/Promises/CCTweakedPureDaisy/master/dist/" .. file).readAll()
  if not content then
        error("Could not connect to website")
  end
  f = fs.open(file, "w")
  f.write(content)
  f.close()
end


download("block.lua")
download("client.lua")
download("lualib_bundle.lua")
download("main.lua")
download("world/grid/Vector3.lua")
download("world/utils/utils.lua")
download("world/items.lua")
download("world/turtle.lua")
