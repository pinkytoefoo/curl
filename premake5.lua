project "curl"
    kind "StaticLib"
    language "C"

    targetdir ("%{wks.location}/build/%{prj.name}")
    objdir ("%{wks.location}/build/int/%{prj.name}")

    files {
        "src/**.c",
        "src/**.h",
        "lib/**.c",
        "lib/**.h",
        "include/curl/**.h",
    }

    includedirs {
        "include",
        "lib",
    }

    defines { "CURL_STATICLIB" }

    filter "system:windows"
        systemversion "latest"
        defines {
            "WIN32",
            "_WINDOWS",
            "USE_SCHANNEL",
            "USE_WINDOWS_SSPI",
            "USE_WIN32_IDN"
        }

        links {
            "Ws2_32",
            "Wldap32",
            "Crypt32",
            "Normaliz",
            "Bcrypt",
            "Secur32"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"

    filter {}