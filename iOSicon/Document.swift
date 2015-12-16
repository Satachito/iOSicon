import	Cocoa
import	Quartz
class
Document: NSDocument {

	dynamic	var	image	:	NSImage?
	
	override func
	makeWindowControllers() {
		addWindowController(
			NSStoryboard(
				name: "Main"
			,	bundle: nil
			).instantiateControllerWithIdentifier(
				"Document Window Controller"
			) as! NSWindowController
		)
	}

	override func
	readFromURL( url: NSURL, ofType typeName: String ) throws {
		image = NSImage( data: PDFDocument( URL: url )!.pageAtIndex( 0 ).dataRepresentation() )
	}
	
	func
	Out( url: NSURL, _ p: Int ) {
		if let wImage = image {
			let wRects = NSRectPointer.alloc( 1 )
			let w = CGFloat( p ) / CGFloat( NSScreen.screens()![ 0 ].backingScaleFactor )
			wRects.memory = NSMakeRect( 0, 0, w, w )
			let cgRef = wImage.CGImageForProposedRect( wRects, context:nil, hints:nil )!
			let newRep = NSBitmapImageRep( CGImage:cgRef )
			let pngData = newRep.representationUsingType( .NSPNGFileType, properties:[:] )!
			pngData.writeToURL( url.URLByAppendingPathComponent( "\(p).png" ), atomically:true )
			wRects.dealloc( 1 )
		}
	}
	
	func
	Export( url: NSURL ) {
		Out( url, 29 );
		Out( url, 40 );
		Out( url, 58 );
		Out( url, 76 );
		Out( url, 80 );
		Out( url, 87 );
		Out( url, 120 );
		Out( url, 152 );
		Out( url, 167 );
		Out( url, 180 );
		Out( url, 1024 );
	}
}
