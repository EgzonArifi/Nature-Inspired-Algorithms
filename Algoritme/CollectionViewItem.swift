
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
        //view.layer?.backgroundColor = NSColor.lightGray.cgColor
        view.layer?.borderColor = NSColor.white.cgColor
        view.layer?.borderWidth = 0.0
    }
    
    func configCell(binPack: BinPack) {
        let totHeight = self.view.frame.size.height
        
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
        
        var lastY:Float = 0.0
        var lastHeight:Float = 0.0
        
        for item in binPack.weights {
            
            lastHeight = Float((item/5)*Float(totHeight))
            let label = NSTextField(frame: NSRect(x: 0, y: Int(lastY), width: Int(self.view.frame.size.width), height: Int(lastHeight)))
            label.backgroundColor = NSColor(calibratedRed: 228.0/255.0, green: 77.0/255.0, blue: 40.9/255.0, alpha: 1.0)
            label.textColor = .white
            label.font = NSFont.systemFont(ofSize: 15)
            label.refusesFirstResponder = true
            label.isEditable = false
            label.isSelectable = true
            
            lastHeight = lastHeight + lastHeight/1.6
            lastY = lastY + lastHeight/1.6
            
            
            label.stringValue = "\(item)"
            self.view.addSubview(label)
        }
    }
    
}
