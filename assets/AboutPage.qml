import bb.cascades 1.2

Sheet{
    onCreationCompleted: {open();}
    peekEnabled: false
    attachedObjects: [Invocation{
            id: email;
            query.mimeType: "text/plain";query.invokeTargetId: "sys.pim.uib.email.hybridcomposer";query.invokeActionId: "bb.action.SENDEMAIL"
            onArmed: {email.trigger(email.query.invokeActionId); } },
        Invocation
        {
            id: facebook
            query: InvokeQuery
            {
                id: query
                mimeType: "text/html"
                uri: "http://facebook.com/AllstarSoftware"
                invokeActionId: "bb.action.OPEN"
            }
        }, 
        Invocation
        {
            id: twitter
            query: InvokeQuery
            {
                id: query2
                mimeType: "text/html"
                uri: "https://twitter.com/paulwallace1234"
                invokeActionId: "bb.action.OPEN"
            }
        }, 
        Invocation
        {
            id: privacy
            query: InvokeQuery
            {id: query5
                mimeType: "text/html"
                uri: "http://allstarsoftware.co.uk/BlackBerryWorldPrivacyPolicy.txt"
                invokeActionId: "bb.action.OPEN"
            }
        } 
    ]
    content: Page {
        titleBar: TitleBar {
            appearance: TitleBarAppearance.Branded
            title: ("Custom Shortcuts v"+ Application.applicationVersion.substring(0,4)) 
            dismissAction: ActionItem {
                title: ("Close") 
                id: closeBut
                onTriggered: {close();}
                }
            }
        
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            layout: StackLayout {}
            
            Container {
                topPadding: 20
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Top
            ImageView {
                imageSource: "images/icon.png"
            }}
            Button {
            layoutProperties: StackLayoutProperties {}
              text: "Email"  
              horizontalAlignment: HorizontalAlignment.Center
              onClicked: {
                  email.query.uri = "mailto:contact@allstarsoftware.co.uk?subject=Custom Shortcuts     BlackBerry 10&body=" + ""; email.query.updateQuery();
              }
            }
            Button {
                layoutProperties: StackLayoutProperties {}
                horizontalAlignment: HorizontalAlignment.Center
                text: "Facebook"
                onClicked:{facebook.trigger("bb.action.OPEN")}
            }
            Button {
                layoutProperties: StackLayoutProperties {}
                horizontalAlignment: HorizontalAlignment.Center
                text: "Twitter"
                onClicked:{twitter.trigger("bb.action.OPEN")}
            }
            Button {
                layoutProperties: StackLayoutProperties {}
                horizontalAlignment: HorizontalAlignment.Center
                text: "Privacy Policy"
                onClicked:{privacy.trigger("bb.action.OPEN")}
            }
        }
        }
    }


