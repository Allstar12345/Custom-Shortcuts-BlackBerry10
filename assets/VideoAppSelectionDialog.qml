import bb.system 1.0
import bb.cascades 1.0

Container {
    id: cont
    
    onCreationCompleted: {
        dio.show()
    }
    function close(){cont.destroy();}
    attachedObjects: 
    SystemDialog{
        id: dio
        title: "App Selection"
        body: "How Would You Like The Shortcut To Be Opened?"
        buttonAreaLimit: 2
        confirmButton.label: qsTr("Video Player")
        confirmButton.enabled: true
        cancelButton.label: qsTr("Video Viewer")
        cancelButton.enabled: true
        onFinished: {
            if(result == SystemUiResult.ConfirmButtonSelection) {
                fileURL= "videos://" + selectedFile;
                selectedFile="";
            }
            else if (result == SystemUiResult.CancelButtonSelection) {
                fileURL= "file://" + selectedFile;
                selectedFile="";
            
            }
        }
    }
}