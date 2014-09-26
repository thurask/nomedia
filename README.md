nomedia
=======

A short example app for BlackBerry 10 Cascades.
Write/delete .nomedia files in a given directory, thus hiding media files within them from the system Pictures/Music/Videos apps.

* Write C++ to create, delete and check the existence of a file
* Link that C++ to the QML UI
* Use a FilePicker to get the path for a file
* Read variables and execute functions in C++ from QML
* Use a SystemToast to notify the user about performed actions

Note: the Shared Files permission is mandatory for the app, otherwise it can't create any .nomedia files.