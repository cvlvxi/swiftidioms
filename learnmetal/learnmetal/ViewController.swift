import Cocoa
import Metal
import MetalKit


class ViewController: NSViewController {

    var device:MTLDevice! = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        device = MTLCreateSystemDefaultDevice();
    }


    override var representedObject: Any? {
      didSet {
        // Update the view, if already loaded.
      }
    }
}
