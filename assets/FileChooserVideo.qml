import bb.cascades 1.0
import bb.cascades.pickers 1.0


Container {
    onCreationCompleted: {
        filePicker.open();
    }
    attachedObjects:    FilePicker {
        id:filePicker
        type :FileType.Video
        mode: FilePickerMode.Picker
        title : "Choose Video"
        directories : ["/accounts/"]
        filter: FileType.Video
        onError: {toast.showText("An Error Occurred")}
        onFileSelected : {
            selectedFile=selectedFiles.toString()
            creator.createQMLObject("VideoAppSelectionDialog.qml")
            console.log("FileSelected signal received : " + selectedFiles);
        }
    }
}