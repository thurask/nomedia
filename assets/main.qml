import bb.cascades 1.2
import bb.cascades.pickers 1.0 //for file picker
import bb.system 1.2 //for toast

Page {
    property string selecteddir //selected directory
    property bool fileexists //does .nomedia exist?
    attachedObjects: [
        FilePicker {
            id: picker
            title: qsTr("File Picker") + Retranslate.onLanguageChanged
            mode: FilePickerMode.SaverMultiple //folder mode
            onFileSelected: {
                selecteddir = (selectedFiles[0] + "/") //get target directory from FilePicker, append / to the end
                Nomedia.setDir(selecteddir) //send the above dir to the C++
                fileexists = Nomedia.checkNomedia() //set the QML boolean value based on a returned boolean from C++
            }
        },
        SystemToast {
            id: toast
            body: "" //we'll write what this says upon clicking a button below
        }
    ]
    titleBar: TitleBar {
        title: qsTr("Nomedia Helper") + Retranslate.onLanguageChanged
    }
    Container {
        topPadding: 20.0 //separate this from the TitleBar, make it look nicer
        Button {
            text: qsTr("Choose a Directory") + Retranslate.onLanguageChanged
            horizontalAlignment: HorizontalAlignment.Center
            onClicked: {
                picker.open() //open the picker
            }
        }
        Label {
            text: qsTr("Current Directory:") + Retranslate.onLocaleOrLanguageChanged            
        }
        Label {
            text: selecteddir //which directory we have selected
        }
        Label {
            id: existlabel
            text: qsTr(".nomedia File Exists: ") + Retranslate.onLanguageChanged + fileexists //true or false
        }
        Container {
            topPadding: 10.0 //just a visual preference thing
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            horizontalAlignment: HorizontalAlignment.Center
            Button {
                text: qsTr("Write .nomedia File") + Retranslate.onLanguageChanged
                enabled: (fileexists == true ? false : true) //exists if .nomedia does not
                onClicked: {
                    Nomedia.writeNomedia() //create blank file .nomedia
                    fileexists = Nomedia.checkNomedia() //set buttons
                    toast.body = qsTr("File created!") + Retranslate.onLanguageChanged //set SystemToast body text
                    toast.show() //pull it up
                }
            }
            Button {
                text: qsTr("Delete .nomedia File") + Retranslate.onLanguageChanged
                enabled: (fileexists == false ? false : true) //exists if .nomedia does
                onClicked: {
                    Nomedia.deleteNomedia() //delete .nomedia
                    fileexists = Nomedia.checkNomedia() //set buttons
                    toast.body = qsTr("File deleted!") + Retranslate.onLanguageChanged //set SystemToast body text
                    toast.show() //pull it up
                }
            }
        }
    }
}
