#ifndef USERCONTROL_H
#define USERCONTROL_H

#include <QObject>

class UserControl : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString dsName READ dsName WRITE setDsName NOTIFY dsNameChanged FINAL)
    Q_PROPERTY(QString dsPhoneNumber READ dsPhoneNumber WRITE setDsPhoneNumber NOTIFY
                   dsPhoneNumberChanged FINAL)
public:
    explicit UserControl(QObject *parent = nullptr);

    Q_INVOKABLE void updateInfomations(const QString &dsName, const QString &dsPhoneNumber);

    QString dsName() const;
    void setDsName(const QString &dsName);

    QString dsPhoneNumber() const;
    void setDsPhoneNumber(const QString &newDsPhoneNumber);

signals:
    void dsNameChanged();
    void dsPhoneNumberChanged();

private:
    QString _dsName;
    QString _dsPhoneNumber;
};

#endif // USERCONTROL_H
