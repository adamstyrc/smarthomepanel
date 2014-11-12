#include "navigationmanager.h"

NavigationManager2::NavigationManager2(QObject *parent) :
    QObject(parent)
{
    mCurrentView = DASHBOARD;
}

NavigationManager2::View NavigationManager2::getCurrentView() {
    return mCurrentView;
}

bool NavigationManager2::goBack() {
    if (mCurrentView != DASHBOARD) {
        mCurrentView = DASHBOARD;
        return false;
    } else {
        return true;
    }
}
