QT_DIR="$(QT5_DIR)"
APP_NAME="qt5base"
------------------------------------------------------------------------------
-- solution
------------------------------------------------------------------------------
solution(APP_NAME) 
configurations { "Release", "Debug" }
configuration "vs*"
do
	defines {
		"_CRT_SECURE_NO_WARNINGS",
		"_CRT_SECURE_NO_DEPRECATE",
	}
	linkoptions { 
	}
end

configuration "windows"
do
	defines {
		'WIN32',
		'_WIN32',
		'_WINDOWS',
	}
end

configuration "Debug"
do
	defines { "DEBUG" }
	flags { "Symbols", }
	targetdir "debug"
end

configuration "Release"
do
	defines { "NDEBUG" }
	flags { "Optimize", }
	targetdir "release"
end

configuration {}

------------------------------------------------------------------------------
-- Project
------------------------------------------------------------------------------
project(APP_NAME)
--language "C"
language "C++"
--kind "StaticLib"
--kind "SharedLib"
--kind "ConsoleApp"
kind "WindowedApp"

flags {
    --"WinMain",
}
files {
    "*.cpp", "*.h",
}

defines {
}
includedirs {
    QT_DIR.."/include",
    QT_DIR.."/include/QtCore",
    QT_DIR.."/include/QtGui",
    QT_DIR.."/include/QtWidgets",
}
buildoptions {
}

libdirs {
    QT_DIR.."/lib",
}
links {
}
linkoptions {
}

prebuildcommands {
    "nmake /nologo /f Makefile.qt",
}
files {
    "moc_mainwindow.cpp",
}

configuration "Debug"
do
    links {
        "Qt5Cored",
        "Qt5Guid",
        "Qt5Widgetsd",
    }
end

configuration "Release"
do
    links {
        "Qt5Core",
        "Qt5Gui",
        "Qt5Widgets",
    }
end

