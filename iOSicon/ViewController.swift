import	Cocoa
import	Quartz

class
ViewController: NSViewController {
	func
	document() -> Document {
		return view.window!.windowController!.document as! Document
	}
	
	override func
	viewWillAppear() {
		super.viewWillAppear()
		(sourceItemView as! NSImageView).image = document().image
	}

	func
	ok( p: AnyObject ) {
		let wSP = NSOpenPanel()
		wSP.canChooseFiles = false
		wSP.canChooseDirectories = true
		wSP.canCreateDirectories = true
		wSP.prompt = "Save"
		wSP.beginSheetModalForWindow( view.window! ) { p in
			if p == NSFileHandlingPanelOKButton {
				self.document().Export( wSP.URL! )
			}
		}
	}
}

