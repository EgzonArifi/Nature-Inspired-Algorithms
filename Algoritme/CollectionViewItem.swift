
import Cocoa

class CollectionViewItem: NSCollectionViewItem {
    
    override var isSelected: Bool {
        didSet {
            view.layer?.borderWidth = isSelected ? 5.0 : 0.0
        }
    }
    
    @IBOutlet weak var changesLAbel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.lightGray.cgColor
        view.layer?.borderColor = NSColor.white.cgColor
        view.layer?.borderWidth = 0.0
    }
    
}
