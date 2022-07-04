import bb.cascades 1.0
import bb.system 1.0
import bb.cascades.pickers 1.0


Container {
    onCreationCompleted: {
        filePicker.open();
    }
    attachedObjects:    FilePicker {
        id:filePicker
        type :FileType.Picture
        mode: FilePickerMode.Picker
        title : "Choose Picture"
        directories : ["/accounts/"]
        filter: FileType.Picture
        onError: {toast.showText("An Error Occurred")}
        onFileSelected : {
            console.log("FileSelected signal received : " + selectedFiles);
            fileURL= "file://" + selectedFiles[0];
        }
    }
}