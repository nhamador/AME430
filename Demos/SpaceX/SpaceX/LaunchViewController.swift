//
//  LaunchViewController.swift
//  SpaceX
//
//  Created by Loren Olson on 10/6/21.
//

import Cocoa

class LaunchViewController: NSViewController {
    @IBOutlet weak var nameField: NSTextField!
    @IBOutlet weak var flightNumberField: NSTextField!
    @IBOutlet weak var patchImageView: NSImageView!
    @IBOutlet weak var flickrImageView: NSImageView!
    
    var launchId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        loadLaunchData(id: launchId)
    }
    
    func loadLaunchData(id: String) {
        let session = URLSession.shared
        
        guard let url = URL(string:"https://api.spacexdata.com/v5/launches/\(id)") else { return }
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error as NSError? {
                // There was an error. Report it to the user, and done.
                print("***** Error *****")
                print(error)
                //self.reportError(error: error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                // Something has gone terribly wrong, there was no HTTP response.
                print("unknown response")
                return
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                // The HTTP status code is an error. Report it to the user, and done.
                print("http response code \(httpResponse.statusCode)")
                //self.reportStatus(code: httpResponse.statusCode)
                return
            }
            
            print("***** Here is the HttpResponse: ******")
            print(httpResponse)
            
            // Unwrap the data object.
            guard let data = data else {
                print("failed to unwrap data?")
                return
            }
            
            if let string = String(data: data, encoding: .utf8) {
                print("***** Here is the data as a string *****")
                print(string)
            }
            
            // Decode the JSON response.
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            var launchDecoded: Launch
            do {
                launchDecoded = try decoder.decode(Launch.self, from: data)
            }
            catch {
                print("*** json decode error")
                print(error)
                return
            }
            
            print("***** Decoded String *****")
            print(launchDecoded)
            
            // Load the patch image from website (asynchronous)
            if let patchUrl = URL(string: launchDecoded.links.patch.large) {
                DispatchQueue.global().async {
                    let patchImage = NSImage(contentsOf: patchUrl)
                    DispatchQueue.main.async {
                        self.patchImageView.image = patchImage
                    }
                }
            }
            
            if launchDecoded.links.flickr.original.count > 0, let flickrUrl = URL(string: launchDecoded.links.flickr.original[0]) {
                DispatchQueue.global().async {
                    let flickrImage = NSImage(contentsOf: flickrUrl)
                    DispatchQueue.main.async {
                        self.flickrImageView.image = flickrImage
                    }
                }
            }
            
            DispatchQueue.main.async {
                // Update the UI on the main thread.
                
                self.nameField.stringValue = launchDecoded.name
                self.flightNumberField.integerValue = launchDecoded.flightNumber
                
                if let window = self.view.window {
                    window.title = launchDecoded.name
                }
            }
            
        })
        
        task.resume()
    }
    
}
