//
//  ViewController.swift
//  ImageFromURL
//
//  Created by student on 10/19/21.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImageData()
  


    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func loadImageData() {
        
        if let patchUrl = URL(string: "https://images.metmuseum.org/CRDImages/ad/original/ADA3157.jpg" /*self.objects[objectid].primaryImage*/) {
            DispatchQueue.global().async {
                let patchImage = NSImage(contentsOf: patchUrl)
                DispatchQueue.main.async {
                    self.artImage.image = patchImage
                }
            }
        }
    }
    


}

