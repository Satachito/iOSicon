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
		for w in NSScreen.screens()! {
			print( w, w.backingScaleFactor )
		}
	}
	
	func
	Out( p: Int ) {
		if let wImage = image {
			let wRects = NSRectPointer.alloc( 1 )
			wRects.memory = NSMakeRect( 0, 0, CGFloat( p ), CGFloat( p ) )
			let cgRef = wImage.CGImageForProposedRect( wRects, context:nil, hints:nil )!
			let newRep = NSBitmapImageRep( CGImage:cgRef )
			let pngData = newRep.representationUsingType( .NSPNGFileType, properties:[:] )!
			pngData.writeToFile( "/Users/sat/tmp/\(p).png", atomically:true )
			wRects.dealloc( 1 )
		}
	}
	
	func
	complete( p: AnyObject ) {
		Out( 29 );
		Out( 40 );
		Out( 58 );
		Out( 76 );
		Out( 80 );
		Out( 87 );
		Out( 120 );
		Out( 152 );
		Out( 180 );
		Out( 1024 );
	}
}

/*	Almost OK, but writter 200 x 200 on retina
			let wRects = NSRectPointer.alloc( 1 )
			wRects.memory = NSMakeRect( 0, 0, 100, 100 )
			let cgRef = wImage.CGImageForProposedRect( wRects, context:nil, hints:nil )!
			let newRep = NSBitmapImageRep( CGImage:cgRef )
			let pngData = newRep.representationUsingType( .NSPNGFileType, properties:[:] )!
			pngData.writeToFile( "/Users/sat/tmp/x.png", atomically:true )
			wRects.dealloc( 1 )
*/
