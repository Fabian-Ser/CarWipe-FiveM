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
PerformHttpRequest("https://versie.lucadev.nl/CarWipe-FiveM/version.txt", function( err, text, headers )
	-- Wait to reduce spam
	Citizen.Wait( 2000 )

	-- Print the branding!
	print( label )

	-- Get the current resource version
	local curVer = GetCurrentVersion()

	print( "  ||    Current version: " .. curVer )

	if ( text ~= nil ) then
		-- Print latest version
		print( "  ||    Latest recommended version: " .. text .."\n  ||" )

		-- If the versions are different, print it out
		if ( text ~= curVer ) then
			print( "  ||    ^1Your CarWipe version is outdated, visit the github at https://github.com/LucaNL/CarWipe-FiveM to get the latest version.\n^0  \\\\\n" )
		else
			print( "  ||    ^2CarWipe is up to date!\n^0  ||\n  \\\\\n" )
		end
	else
		-- In case the version can not be requested, print out an error message
		print( "  ||    ^1There was an error getting the latest version information.\n^0  ||\n  \\\\\n" )
	end

	-- Warn the console if the resource has been renamed, as this will cause issues with the resource's functionality.
	if ( GetCurrentResourceName() ~= "CarWipe" ) then
		print( "^1ERROR: Resource name is not CarWipe, expect there to be issues with the resource. To ensure there are no issues, please leave the resource name as CarWipe^0\n\n" )
	end
end )
