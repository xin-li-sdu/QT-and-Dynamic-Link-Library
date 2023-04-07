QT += quick quickcontrols2 concurrent network multimedia
CONFIG += c++17
DEFINES += QT_DEPRECATED_WARNINGS QT_NO_WARNING_OUTPUT

HEADERS += \
    ChatController.h \
    abc.h

SOURCES += \
        ChatController.cpp \
        abc.cpp \
        main.cpp

RESOURCES += qml.qrc
include($$PWD/gsl/gsl.pri)
RC_ICONS = favicon.ico

QML_IMPORT_PATH =
QML_DESIGNER_IMPORT_PATH =

CONFIG(debug,debug|release) {
    DESTDIR = $$absolute_path($${_PRO_FILE_PWD_}/../bin/debug)
} else {
    DESTDIR = $$absolute_path($${_PRO_FILE_PWD_}/../bin/release)
}

win32 {
contains(QT_ARCH, i386) {
    COPYDLL = $$absolute_path($${_PRO_FILE_PWD_}/../third/Win_x86/*.dll) $$DESTDIR
    QMAKE_PRE_LINK += $$QMAKE_COPY $$replace(COPYDLL, /, $$QMAKE_DIR_SEP)
} else {
    COPYDLL = $$absolute_path($${_PRO_FILE_PWD_}/../third/Win_x64/*.dll) $$DESTDIR
    QMAKE_PRE_LINK += $$QMAKE_COPY $$replace(COPYDLL, /, $$QMAKE_DIR_SEP)
}
}

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

mac: {
    QMAKE_INFO_PLIST =
}
include($$PWD/gsl/gsl.pri)
DISTFILES += \
    gsl/gsl.pri
