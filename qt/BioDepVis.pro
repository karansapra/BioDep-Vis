QT += widgets
TARGET = BioDepVis
TEMPLATE = app
CONFIG += c++11 debug

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000

LIBS += \
    -L/usr/local/cuda/lib64 -lcudart

OBJECTS += \
    fdl_cuda.o

SOURCES += \
    alignment.cpp \
    database.cpp \
    fdl.cpp \
    glwidget.cpp \
    graph.cpp \
    main.cpp \
    mainwindow.cpp \
    matrix.cpp

HEADERS += \
    alignment.h \
    database.h \
    fdl.h \
    glwidget.h \
    graph.h \
    mainwindow.h \
    matrix.h \
    vector.h
