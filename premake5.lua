project "json"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    location "build"

    targetdir (".Out/Bin/" .. output_dir .. "%{prj.name}")
    objdir    (".Out/Obj/" .. output_dir .. "%{prj.name}")

    -- Header only: there is nothing here to compile, and nothing links this. The project exists so the
    -- headers are part of the solution, which is what every other header-only vendor does (see glm).
    includedirs { "include" }

    files {
        "include/nlohmann/**.hpp",
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"

    filter "configurations:Shipping"
        runtime "Release"
        optimize "On"
        symbols "Off"
