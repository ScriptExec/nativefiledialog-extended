project "nativefiledialog-extended"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	conformancemode "true"
	staticruntime "off"

	targetdir ("%{wks.location}/.build/" .. OutputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/.build/temp/" .. OutputDir .. "/%{prj.name}")

	includedirs
	{
		"include"
	}

	filter "system:windows"
		files { "src/nfd_win.cpp" }
	filter "system:linux"
		files { "src/nfd_gtk.cpp" }
	filter "system:macosx"
		files { "src/nfd_cocoa.m" }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Shipping"
		runtime "Release"
		optimize "speed"