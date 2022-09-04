import qbs

Project {
    references: [
        "runtimeqml/runtimeqml.qbs",
    ]

    CppApplication {
        name: "App"
        Depends { name: "Qt.core" }
        Depends { name: "Qt.quick" }
        Depends { name: "runtimeqml" }

        // Additional import path used to resolve QML modules in Qt Creator's code model
        property pathList qmlImportPaths: []

        cpp.cxxLanguageVersion: "c++11"

        files: [
            "main.cpp",
            "qml.qrc",
        ]
    }
}
