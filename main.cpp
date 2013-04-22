#include "mainwindow.h"
#include <QApplication>


int main(int argc, char **argv)
{
    QApplication app(argc, argv);

    auto w=new MainWindow();
    w->show();

    return app.exec();
}

