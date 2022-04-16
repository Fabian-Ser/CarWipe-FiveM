local label =
[[ 
  //   
  ||            __                                    __    __  __       
  ||           |  \                                  |  \  |  \|  \      
  ||           | $$      __    __   _______  ______  | $$\ | $$| $$      
  ||           | $$     |  \  |  \ /       \|      \ | $$$\| $$| $$      
  ||           | $$     | $$  | $$|  $$$$$$$ \$$$$$$\| $$$$\ $$| $$      
  ||           | $$     | $$  | $$| $$      /      $$| $$\$$ $$| $$      
  ||           | $$_____| $$__/ $$| $$_____|  $$$$$$$| $$ \$$$$| $$_____ 
  ||           | $$     \\$$    $$ \$$     \\$$    $$| $$  \$$$| $$     \
  ||            \$$$$$$$$ \$$$$$$   \$$$$$$$ \$$$$$$$ \$$   \$$ \$$$$$$$$                                                                                                                                                                 
  ||                           Created by LucaNL#2230
  ||]]

-- Returns the current version set in fxmanifest.lua
function GetCurrentVersion()
	return GetResourceMetadata( GetCurrentResourceName(), "version" )
end

-- Grabs the latest version number from the web GitHub
PerformHttpRequest("https://version.lucadev.nl/CarWipe-FiveM/version.txt", function( err, text, headers )
	Citizen.Wait(2000)
	print( label )
	local curVer = GetCurrentVersion()
	print( "  ||    Current version: " .. curVer )
	if ( text ~= nil ) then
		print( "  ||    Latest recommended version: " .. text .."\n  ||" )

		if ( text ~= curVer ) then
			print( "  ||    ^1Your CarWipe version is outdated, please visit the FiveM forum page at https://forum.cfx.re/t/release-free-carwipe-fivem/4839898 to get the latest version.\n^0  \\\\\n" )
		else
			print( "  ||    ^2CarWipe is up to date!\n^0  ||\n  \\\\\n" )
		end
	else
		print( "  ||    ^1There was an error getting the latest version information.\n^0  ||\n  \\\\\n" )
	end
end)


print( "  ||    Changes in new version: " .. text .."\n  ||" )


PerformHttpRequest("https://version.lucadev.nl/CarWipe-FiveM/changelog.txt", function( err, text, headers )
	Citizen.Wait(2000)
	local curVer = GetCurrentVersion()
	if ( text ~= nil ) then
		if ( text ~= curVer ) then
			print( "  ||    Changes in new version: " .. text .."\n  ||" )
		end
	else
		print( "  ||    ^1There was an error getting the latest changelog information.\n^0  ||\n  \\\\\n" )
	end
end)