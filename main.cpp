#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <runtimeqml.hpp>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

#ifdef QT_DEBUG
    // In projects where runtimeqml folder is on the same level of the .pro,
    // you can use QRC_SOURCE_PATH (defined in runtimeqml.pri/qbs)

    RuntimeQml *rt = new RuntimeQml(&engine);
    rt->addQrcPrefixIgnoreFilter("noreload");
    rt->addIgnoreFilter("*NoReload.qml");
    rt->parseQrc(QRC_SOURCE_PATH "/qml.qrc");
    rt->setAutoReload(true); // Reload automatically on file update

    engine.rootContext()->setContextProperty("RuntimeQml", rt);

    rt->load(url);
#else
    engine.load(url);
#endif

    return app.exec();
}
