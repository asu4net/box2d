project "box2d"
    kind "StaticLib"
    language "C++"
    staticruntime "off"

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    targetdir ("%{wks.location}/Binaries/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/Intermediate/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/**.h",
        "src/**.cpp",
        "include/**.h"
    }

    includedirs
    {
        "include",
        "src"
    }

    filter "configurations:Debug"
        defines "NIT_DEBUG"
        runtime "Debug"
        symbols "on"
    
    filter "configurations:EditorRelease"
        defines "NIT_RELEASE"
        runtime "Release"
        optimize "on"
        
    filter "configurations:GameRelease"
          defines "NIT_RELEASE"
          runtime "Release"
          optimize "on"
