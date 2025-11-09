#include "usercontrol.h"

#include <QDebug>

UserControl::UserControl(QObject *parent)
    : QObject{parent}
    , _dsName{QLatin1String("")}
    , _dsPhoneNumber(QLatin1String(""))
{}

void UserControl::updateInfomations(const QString &dsName, const QString &dsPhoneNumber)
{
    qInfo() << "UserControl::updateInfomations [DS_NAME]" << dsName << "[DS_PHONE_NUMBER]"
            << dsPhoneNumber;

    setDsName(dsName);
    setDsPhoneNumber(dsPhoneNumber);

    qInfo() << "UserControl::updateInfomations";
}

QString UserControl::dsName() const
{
    qInfo() << "UserControl::dsName";
    return _dsName;
}

void UserControl::setDsName(const QString &dsName)
{
    if (_dsName == dsName) {
        return;
    }

    _dsName = dsName;
    emit dsNameChanged();
}

QString UserControl::dsPhoneNumber() const
{
    qInfo() << "UserControl::dsPhoneNumber";
    return _dsPhoneNumber;
}

void UserControl::setDsPhoneNumber(const QString &dsPhoneNumber)
{
    _dsPhoneNumber = dsPhoneNumber;
    emit dsPhoneNumberChanged();
}
