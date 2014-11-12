#ifndef NAVIGATIONMANAGER_H
#define NAVIGATIONMANAGER_H

#include <QObject>

class NavigationManager2 : public QObject
{
    Q_OBJECT
public:
    explicit NavigationManager2(QObject *parent = 0);

    enum View {
        DASHBOARD,
        ROOMS,
        DEVICES
    };

    Q_INVOKABLE View getCurrentView();
    Q_INVOKABLE bool goBack();


signals:
//    void
public slots:

private:
    View mCurrentView;



};


#endif // NAVIGATIONMANAGER_H
