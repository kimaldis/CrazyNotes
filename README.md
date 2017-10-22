# CrazyNotes
A plugin for attaching markdown notes to sources (collections, folders or Publish Services) in Lightroom.

# Installation & Useage
Install the plugin in the usual way using the Plugin Manager. To attach a note to a collection use the menu Plug-in Extras->CrazyNotes. A new markdown file for the source is created if one doesn't exist. The file is opened for editing and viewing using the app set in the  plugin's preferences found in File->Plug-in Manager. I found it convenient to set a shortcut key combination for the menu in System Preferences->Keyboard->Shortcuts.

# Requirements
The plugin has been tested on OS X 10.13, High Sierra using Lightroom 6. It may work on earlier versions of Lightroom and Widows but Imight require some adjustment to code. I have no way of testing on other versions but I'd be interested if anyone feels like it.

CrazyNotes requires a Markdown editor of some kind. My preference is Typora (http://typora.io), although most editors should function. Set your own editor preference in the plugin's preferences.

# Note Storage
* Notes associated  folders are stored in the associated folder and are named 'CrazyNote.md'
* Notes associated with all other Lightroom sources are stored alongside whatever catalog file is current in a folder named [catalog name].CrazyNotes and are named using the source unique localIdentifier.

