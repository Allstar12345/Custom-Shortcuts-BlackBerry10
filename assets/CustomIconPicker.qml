import bb.cascades 1.0
import bb.cascades.pickers 1.0

Container {
    onCreationCompleted: {filePicker.open();}
    attachedObjects:  FilePicker {
        id:filePicker
        type :FileType.Picture
        mode: FilePickerMode.Picker
        title : "Choose Icon"
        directories : ["/accounts/"]
        filter: FileType.Picture
        onError: {toast.showText("An Error Occurred, do you have Shared Files permission enabled?")}        onFileSelected : {
            console.log("FileSelected signal received : " + selectedFiles);
            iconURL= "file://" + selectedFiles[0];
        }
    }
}