import bb.cascades 1.0
import bb.system 1.0
import bb.cascades.pickers 1.0


Container {
    onCreationCompleted: {
        filePicker.open();
    }
    attachedObjects:    FilePicker {
        id:filePicker
        type :FileType.Other
        mode: FilePickerMode.Picker
        title : "Choose Others"
        directories : ["/accounts/"]
        filter: FileType.Other
        onError: {toast.showText("An Error Occurred")}
        onFileSelected : {
            console.log("FileSelected signal received : " + selectedFiles);
            fileURL= "file://" + selectedFiles[0];
        }
    }
}