import bb.cascades 1.2
import bb.system 1.0
import bb.platform 1.0
import bb.cascades.pickers 1.0


NavigationPane {
    id: navigationPane
    property string selectedFile
    property string fileURL
    property string shortcutLabel
    property string iconURL
    property bool olderFirmware
    property bool olderFirmware12
    onCreationCompleted: {
	if(platinfo.osVersion<("10.2.3".substring(0, 6)))olderFirmware=true; else olderFirmware=false; 
        if(platinfo.osVersion<("10.2.1".substring(0, 6)))olderFirmware12=true;
    }
    Menu.definition: MenuDefinition {
        actions: [
            ActionItem {
                onTriggered: {creator.createQMLObject("AboutPage.qml");}
                imageSource: "asset:///images/ic_info.png"
                title: "About"
            }
        ]
        }
    attachedObjects: [
        PlatformInfo {id: platinfo},
        SystemToast{id: toast;function showText(text) {toast.body = text; toast.show()}},
        HomeScreen {id: hs},
        ComponentDefinition {id: creator; function createQMLObject(sourceUrl){source=sourceUrl; creator.createObject()} }
    ]
    
    Page {
            actions:[ ActionItem {
            title: qsTr("Add Shortcut")
            imageSource: "asset:///images/ic_add.png"
            ActionBar.placement: if(olderFirmware===true)ActionBarPlacement.OnBar
            else{ActionBarPlacement.Signature}
            onTriggered: {
                console.log(fileURL)
                if( shortcutLabel==="")toast.showText("Shortcut cannot be created without a Label")
                else if (fileURL==="")toast.showText("Shortcut cannot be created without a File Or OS Link")
                else if (iconURL==="")toast.showText("Shortcut cannot be created without a Icon")
                else{ hs.addShortcut(iconURL, shortcutLabel, fileURL);toast.showText("Homescreen Shortcut created: "+  shortcutLabel); filedrop.resetSelectedIndex();iconDrop.resetSelectedIndex();osset.resetSelectedIndex();bbworldfield.resetText(); field.resetText(); fieldurl.resetText();}}
        }, 
            ActionItem{
           title: qsTr("Reset Fields")
           ActionBar.placement: ActionBarPlacement.OnBar
           imageSource: "asset:///images/reset.png"
           onTriggered: {
		   filedrop.resetSelectedIndex();
		   iconDrop.resetSelectedIndex();
		   field.resetText();
		   fieldurl.resetText();
		   osset.resetSelectedIndex();
		   bbworldfield.resetText();
		   fileURL="";
		   shortcutLabel=""; 
		   iconURL=""
		   }      
            }]
        titleBar: TitleBar {
            title: qsTr("Custom Shortcuts")
        }
        ScrollView {
            Container { topPadding: 15
            Header { title: "Shortcut Label"} 
            TextField {id: field;maximumLength: 15;  hintText: "Enter Shortcut Label Here";  onTextChanged: {shortcutLabel=text}}
            
        DropDown {
            id: filedrop
            title: "Choose File/Shortcut"
            onSelectedIndexChanged: {
                if(selectedIndex===0){creator.createQMLObject("FileChooserMusic.qml"); osset.resetSelectedIndex();}
                else if(selectedIndex===1){creator.createQMLObject("FileChooserPicture.qml"); osset.resetSelectedIndex();}
                else if(selectedIndex===2){creator.createQMLObject("FileChooserVideo.qml"); osset.resetSelectedIndex();}
                else if(selectedIndex===3){creator.createQMLObject("FileChooserDocuments.qml"); osset.resetSelectedIndex();}
                else if(selectedIndex===5){creator.createQMLObject("FileChooserOthers.qml"); osset.resetSelectedIndex();}
               else if(selectedIndex===7){creator.createQMLObject("ContactsPicker.qml"); osset.resetSelectedIndex();}   
              }
            Option {
                text: "Music"
                value:"music"
            }
            Option {
                text: "Picture"
                value:"picture"
            }
            Option {
                text: "Video"
                value:"video"
            }

            Option {
                text: "Document"
                value: "document"
            }
            Option {
                text: "Webpage"
                value: "webpage"
            }
            Option {
                text: "Others"
            }
            Option {
                text: "OS Shortcuts"
            }
           Option {
                text: "Contact"
            }
            
        }
       
        DropDown {
            id: osset
            onVisibleChanged: {if(visible===true)expanded=true }
            visible: filedrop.selectedIndex===6?true: false;
            
            title: "OS Shortcuts"
            onSelectedIndexChanged: {if(selectedIndex===1){fileURL="music://albums"}
                if(selectedIndex===2){fileURL="music://artists"}
                if(selectedIndex===3){fileURL="music://playlists"}
                if(selectedIndex===4){fileURL="music://genres"}
                if(selectedIndex===5){fileURL="videos://library"}
                if(selectedIndex===6){fileURL="settings://storage"}
                if(selectedIndex===7){fileURL="settings://security"}
                if(selectedIndex===8){fileURL="settings://password"} 
                if(selectedIndex===9){fileURL="settings://language"}
                if(selectedIndex===10){fileURL="settings://language/keyboard"}
                if(selectedIndex===11){fileURL="settings://datetime"}
                if(selectedIndex===12){fileURL="settings://pim"}
                if(selectedIndex===13){fileURL="settings://sharing"}
                if(selectedIndex===14){fileURL="settings://pim/defaultAccounts"}
                if(selectedIndex===15){fileURL="settings://quicksettings"}
                if(selectedIndex===16){fileURL="settings://shortcuts"}
                if(selectedIndex===17){fileURL="settings://datamanagement"}
                if(selectedIndex===18){fileURL="settings://voice"}
                if(selectedIndex===19){fileURL="settings://powersaving"}
                if(selectedIndex===20){fileURL="settings://appmgr"}
                if(selectedIndex===21){fileURL="settings://permissions"}
                if(selectedIndex===22){fileURL="settings://protect"}
                if(selectedIndex===23){fileURL="settings://devmode"}
                if(selectedIndex===24){fileURL="settings://radio"}
                if(selectedIndex===25){fileURL="settings://screenreader"}
                if(selectedIndex===27){fileURL="devicemonitor://battery"}
                if(selectedIndex===28){fileURL="devicemonitor://cpu"}
                if(selectedIndex===29){fileURL="devicemonitor://storage"}
                if(selectedIndex===30){fileURL="devicemonitor://memory"}
             //   if(selectedIndex===31){fileURL="websearch"}

            
            } 
            Option {
                text: "BlackBerry World Content"
                description: "Shortcut to Content on BB World(Type Content ID only)"
            }
            Option{
                text:"Music Player - Albums"
            }
            Option{
                text:"Music Player - Artists"
            }
            Option{
                text:"Music Player - Playlists"
            }
            Option{
                text:"Music Player - Genres"
            }
            Option{
                text:"Videos- Library"
            }
            Option{
                text:"Storage And Access"
            }
            Option{
                text:"Security And Privacy"
            }
            Option{
                text:"Device Password"
            }
            Option{
                text:"Language Settings"
            }
            Option{
                text:"Keyboard Settings"
            }
            Option{
                text:"Date And Time Settings"
            }
            Option{
                text:"Accounts List"
            }
            Option{
                text:"Media Sharing"
            }
            Option{
                text:"Default Accounts Screen"
            }
            Option{
                enabled: olderFirmware12===true? false: true
                text:"Customise Quick Settings"
                description: olderFirmware12===true? "This Feature is unavailable in this OS": ""
            }
            Option{
                text:"Shortcuts and Speed Dial"
            }
            Option {
             enabled: olderFirmware===true? false: true
                text:"Data Management"
                description: olderFirmware===true? "This Feature is unavailable in this OS": ""
            }
            Option {
                text:olderFirmware===true? "Voice Control Settings" : "BlackBerry Assistant Settings"
            }
            Option{
                enabled: olderFirmware===true? false: true
                text:"Battery Saving Settings"
                description: olderFirmware===true? "This Feature is unavailable in this OS": ""
            }
            Option{
                text:"Application Manager"
            }
            Option{
                text:"Application Permissions"
            }
            Option{
                text:"BlackBerry Protect"
            }
            Option{
                text:"Development Mode"
            }
            Option{
                text:"Mobile Network"
            }
            Option{
                text:"Screen Reader"
            }
            Option{
                text:"Search Term"
            }
            Option{
                text:"Battery-Device Monitor"
            }
            Option{
                text:"CPU-Device Monitor"
            }
            Option{
                text:"Storage-Device Monitor"
            }
            Option{
                text:"Memory-Device Monitor"
            }
            Option{
                text:"Web Search Term"
            }
            
        }
        Header {
		visible: osset.selectedIndex===31 ? true: false;
		title:"Web Search Term"
		} 
		
        TextField {
		visible: osset.selectedIndex===31 ? true: false;
		id: wesear; 
		hintText: "Enter Web Search Term Here"; 
		inputMode: TextFieldInputMode.Text;
		onTextChanged: {
		fileURL= "websearch:"+ text
		}
		}
       
	   Header {
	   visible: osset.selectedIndex === 26 ? true: false;
	   title:"Search Term"
	   } 
       
	   TextField {
	   visible: osset.selectedIndex===26 ? true: false;
	   id: sear; 
	   hintText: "Enter Search Term Here";
	   inputMode: TextFieldInputMode.Text; 
	   onTextChanged: {
	   fileURL= "search://?term=" + text
	   }
	   }
       
	   Header {
	   visible: osset.selectedIndex===0? true: false; 
	   title: "BB World Content"
	   } 
      
	  TextField {
	  visible: osset.selectedIndex===0 ? true: false;
	  id: bbworldfield; 
	  hintText: "Enter BB World Content ID Here";
	  inputMode: TextFieldInputMode.Pin; 
	  onTextChanged: {
	  fileURL= "appworld://content/"+ text
	  }
	  }
       
	   Header {
	   visible: filedrop.selectedIndex === 4 ? true: false;
	   title: "Webpage URL"
	   }
	   
       
	   TextField {
	   visible: filedrop.selectedIndex === 4 ? true: false;
	   id: fieldurl; 
	   text: "http://"; 
	   hintText: "Enter Webpage URL Here";
	   inputMode: TextFieldInputMode.Url;
	   onTextChanged: {
	   fileURL = text
	   }
	   }
       
	   DropDown {
            id: iconDrop
            onSelectedIndexChanged: iconURL=selectedValue
            title: "Choose Icon"
            Option {
                text: "Custom Icon"
                onSelectedChanged: {
                    if(selected)creator.createQMLObject("CustomIconPicker.qml")
                }
            }
            Option {
                text: "Music"
                value: "asset:///images/music.png"
                imageSource: "asset:///images/music.png"
            }
            Option {
                text: "Picture"
                value: "asset:///images/picture.png"
                imageSource: "asset:///images/picture.png"
            }
            Option {
                text: "Video"
                value: "asset:///images/video.png"
                imageSource: "asset:///images/video.png"
            }
            Option {
                text: "PPT"
                value: "asset:///images/ppt.png"
                imageSource: "asset:///images/ppt.png"
            }
            Option {
                text: "XLS"
                value: "asset:///images/xls.png"
                imageSource: "asset:///images/xls.png"
            }
            Option {
                text: "DOC"
                value: "asset:///images/doc.png"
                imageSource: "asset:///images/doc.png"
            }
            Option {
                text: "Text/General"
                value: "asset:///images/text.png"
                imageSource: "asset:///images/text.png"
            }
            Option {
                text: "PDF"
                value: "asset:///images/pdf.png"
                imageSource: "asset:///images/pdf.png"
            }
            Option {
                text: "Webpage/Web Document"
                value: "asset:///images/webpage.png"
                imageSource: "asset:///images/webpage.png"
            }
            Option {
                text: "ZIP"
                value: "asset:///images/zip.png"
                imageSource: "asset:///images/zip.png"
            }
            Option {
                text: "Setting"
                value: "asset:///images/settings.png"
                imageSource: "asset:///images/settings.png"
            }
            Option {
                text: "Share"
                value: "asset:///images/share.png"
                imageSource: "asset:///images/share.png"
            }
            Option {
                text: "Battery"
                value: "asset:///images/battery.png"
                imageSource: "asset:///images/battery.png"
            }
            Option {
                text: "Security/Lock"
                value: "asset:///images/lock.png"
                imageSource: "asset:///images/lock.png"
            }
            Option {
                text: "Search"
                value: "asset:///images/search.png"
                imageSource: "asset:///images/search.png"
            }
            Option {
                text: "Contact"
                value: "asset:///images/contact.png"
                imageSource: "asset:///images/contact.png"
            }
            Option {
                text: "Music"
                value: "asset:///images/music_circle.png"
                imageSource: "asset:///images/music_circle.png"
            }
            Option {
                text: "Picture"
                value: "asset:///images/picture_circle.png"
                imageSource: "asset:///images/picture_circle.png"
            }
            Option {
                text: "Video"
                value: "asset:///images/video_circle.png"
                imageSource: "asset:///images/video_circle.png"
            }
            Option {
                text: "PPT"
                value: "asset:///images/ppt_circle.png"
                imageSource: "asset:///images/ppt_circle.png"
            }
            Option {
                text: "XLS"
                value: "asset:///images/xls_circle.png"
                imageSource: "asset:///images/xls_circle.png"
            }
            Option {
                text: "DOC"
                value: "asset:///images/doc_circle.png"
                imageSource: "asset:///images/doc_circle.png"
            }
            Option {
                text: "Text/General"
                value: "asset:///images/text_circle.png"
                imageSource: "asset:///images/text_circle.png"
            }
            Option {
                text: "PDF"
                value: "asset:///images/pdf_circle.png"
                imageSource: "asset:///images/pdf_circle.png"
            }
            Option {
                text: "Webpage/Web Document"
                value: "asset:///images/webpage_circle.png"
                imageSource: "asset:///images/webpage_circle.png"
            }
            Option {
                text: "ZIP"
                value: "asset:///images/zip_circle.png"
                imageSource: "asset:///images/zip_circle.png"
            }
            Option {
                text: "Setting"
                value: "asset:///images/settings_circle.png"
                imageSource: "asset:///images/settings_circle.png"
            }
            Option {
                text: "Share"
                value: "asset:///images/share_circle.png"
                imageSource: "asset:///images/share_circle.png"
            }
            Option {
                text: "Battery"
                value: "asset:///images/battery_circle.png"
                imageSource: "asset:///images/battery_circle.png"
            }
            Option {
                text: "Security/Lock"
                value: "asset:///images/lock_circle.png"
                imageSource: "asset:///images/lock_circle.png"
            }
            Option {
                text: "Search"
                value: "asset:///images/search_circle.png"
                imageSource: "asset:///images/search_circle.png"
            }
            Option {
                text: "Contact"
                value: "asset:///images/contact_circle.png"
                imageSource: "asset:///images/contact_circle.png"
            }
        
            
        }
    }
    }
}
}
