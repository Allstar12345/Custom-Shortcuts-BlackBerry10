import bb.cascades 1.0
import bb.cascades.pickers 1.0


Container {
    onCreationCompleted: {
        filePicker.open();
    }
    attachedObjects:    FilePicker {
        id:filePicker
        type :FileType.Document
        mode: FilePickerMode.Picker
        title : "Choose Document"
        directories : ["/accounts/"]
        filter: FileType.Document
        onError: {toast.showText("An Error Occurred")}
        onFileSelected : {
            console.log("FileSelected signal received : " + selectedFiles);
            fileURL= "file://" + selectedFiles[0];
        }
    }
}