#ifndef BACKENDHELPER_H
#define BACKENDHELPER_H

#include <QObject>
#include <QQmlEngine>
#include <QDateTime>
#include <QLocale>

class BackendHelper : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
public:
    explicit BackendHelper(QObject *parent = nullptr);

    Q_PROPERTY(QString currentDay READ currentDay WRITE setCurrentDay NOTIFY currentDayChanged FINAL)
    Q_PROPERTY(QString currentMonth READ currentMonth WRITE setCurrentMonth NOTIFY currentMonthChanged FINAL)
    Q_PROPERTY(QString currentYear READ currentYear WRITE setCurrentYear NOTIFY currentYearChanged FINAL)
    Q_PROPERTY(QString currentDayOfWeek READ currentDayOfWeek WRITE setCurrentDayOfWeek NOTIFY currentDayOfWeekChanged FINAL)

    QString currentDay() const;
    void setCurrentDay(const QString &newCurrentDay);

    QString currentMonth() const;
    void setCurrentMonth(const QString &newCurrentMonth);

    QString currentYear() const;
    void setCurrentYear(const QString &newCurrentYear);

    QString currentDayOfWeek() const;
    void setCurrentDayOfWeek(const QString &newCurrentDayOfWeek);

signals:
    void currentDayChanged();
    void currentMonthChanged();

    void currentYearChanged();

    void currentDayOfWeekChanged();

private:
    QString m_currentDay;
    QString m_currentMonth;
    QString m_currentYear;
    QString m_currentDayOfWeek;
};

#endif // BACKENDHELPER_H
