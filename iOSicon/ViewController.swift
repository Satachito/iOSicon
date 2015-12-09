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
}

