#include "applicationui.hpp"
#include "Nomedia.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument> //QmlDocument allows us to link C++ functions with the QML UI

#include <QtCore>
#include <Qt/qdeclarativedebug.h>

using namespace bb::cascades;

Q_DECL_EXPORT int main(int argc, char **argv)
{
    Application app(argc, argv);

    Nomedia nomedia; //import C++ function from NomediaClass.hpp
    QmlDocument::defaultDeclarativeEngine()->rootContext()->setContextProperty("Nomedia", &nomedia); //make it usable in QML, just call Nomedia.aFunction()

    // Create the Application UI object, this is where the main.qml file
    // is loaded and the application scene is set.
    ApplicationUI appui;

    // Enter the application main event loop.
    return Application::exec();
}
