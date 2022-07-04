import bb.cascades 1.0
import bb.cascades.pickers 1.0


Container {
    onCreationCompleted: {
        filePicker.open();}
    attachedObjects:    FilePicker {
        id:filePicker
        type :FileType.Music
        mode: FilePickerMode.Picker
        title : "Choose Music"
        directories : ["/accounts/"]
        filter: FileType.Music
        onError: {toast.showText("An Error Occurred")}

        onFileSelected : {
            selectedFile=selectedFiles.toString()
            creator.createQMLObject("MusicAppSelectionDialog.qml")
            console.log("FileSelected signal received : " + selectedFiles);
        }
    }
}