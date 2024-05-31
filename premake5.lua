project "nativefiledialog-extended"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	conformancemode "true"
	staticruntime "off"

	targetdir (ProjectTargetDir)
	objdir (ProjectObjDir)

	includedirs
	{
		"src/include"
	}

	filter "system:windows"
		files { "src/nfd_win.cpp" }

	filter "system:linux"
		files { "src/nfd_gtk.cpp" }
		buildoptions { "`pkg-config --cflags gtk+-3.0 glib-2.0`" }
		linkoptions { "`pkg-config --libs gtk+-3.0 glib-2.0`" }

	filter "system:macosx"
		files { "src/nfd_cocoa.m" }

		links
		{
            "AppKit.framework",
            "UniformTypeIdentifiers.framework"
        }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Shipping"
		runtime "Release"
		optimize "speed"