#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include <QtQml>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
