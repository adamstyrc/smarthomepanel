#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "navigationmanager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();
    NavigationManager2 *navigationManager2 = new NavigationManager2();
    context->setContextProperty("navigationManager", navigationManager2);
//    engine.load(QUrl(QStringLiteral("qrc:///dashboard.qml")));
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
