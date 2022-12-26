project "box2d"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    staticruntime "on"

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

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

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"