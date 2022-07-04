import bb.cascades 1.0
import bb.system 1.0
import bb.cascades.pickers 1.0


Container {
    onCreationCompleted: {
        contactPicker.open();
    }
    attachedObjects: 
    ContactPicker {
        id: contactPicker
        title:"Select Contact"
        mode: ContactSelectionMode.Single
        
        onContactSelected: {
            console.log(contactId)

console.log(appUI.getPhoneNumber(contactId))
fileURL= "tel:"+appUI.getPhoneNumber(contactId) .toString();
        
    }    }
}