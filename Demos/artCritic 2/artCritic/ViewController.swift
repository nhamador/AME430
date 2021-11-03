//
//  ViewController.swift
//  artCritic
//
//  Created by student on 10/14/21.
//

import Cocoa


class ViewController: NSViewController {

 
    @IBOutlet weak var label: NSTextField!
    @IBOutlet weak var artImage: NSImageView!
    @IBOutlet weak var ratingField: NSTextField!
    @IBOutlet weak var next: NSButton!
    @IBOutlet weak var reaction1: NSTextField!
    @IBOutlet weak var reaction2: NSTextField!
    @IBOutlet weak var reaction3: NSTextField!
    
    
    
    var objects: [Object] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(2021); //keeping this since I got a bit attached to it during debugging
        next.action = #selector(ViewController.nextHandler(_:))
    }

    override var representedObject: Any? {
        didSet {
        }
    }
    func loadData(_ objectID : Int) {
        //let objectid = 223;
        let session = URLSession.shared
        guard let url = URL(string:"https://collectionapi.metmuseum.org/public/collection/v1/objects/\(objectID)"
                ) else { return }
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error as NSError? {
                // There was an error. Report it to the user, and done.
                print("***** Error *****")
                print(error)
                self.reportError(error: error)
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
                self.reportStatus(code: httpResponse.statusCode)
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
            decoder.keyDecodingStrategy = .convertFromSnakeCase //prolly unneeded
            
            var object: Object!
            do{
                object = try decoder.decode(Object.self, from: data)
            }
            catch {
                print("*** json decode error")
                print(error)
            }

            
            print("***** Decoded String *****")
            print(self.objects.count)

            if(object.primaryImage == ""){ //this is to improve overall speed between loading
                self.loadData(Int.random(in: 430_000..<440_000));
            }
            
            
            
            DispatchQueue.main.async
            {
                if let patchUrl = URL(string: object.primaryImage ) {
                    DispatchQueue.global().async {
                        let patchImage = NSImage(contentsOf: patchUrl)
                        DispatchQueue.main.async {
                            self.artImage.image = patchImage
                            self.label.stringValue = object.title
                            self.reaction1.stringValue = ""
                            self.reaction2.stringValue = ""
                            self.reaction3.stringValue = ""

                        }
                    }
                }
             

            }
            
        })
        
        task.resume()
        
        
    }
    
  
    @IBAction func nextHandler(_ sender: Any) {
        loadData(Int.random(in: 434_000..<440_000)); //too many 404s to handle just reloading instead
    }
    
    @IBAction func updateReaction(_ sender: Any) {

            for number in  1...3{
                let randReact = Int.random(in: 1..<16)
                var reactionString = "";
                switch randReact{
                    case 1:
                        reactionString = "do you really know what you're doing?"
                    case 2:
                        reactionString = "I suppose a broken clock is right twice a day..."
                    case 3:
                        reactionString = "Some people just don't understand art"
                    case 4:
                        reactionString = "You should really see their earlier work"
                    case 5:
                        reactionString = "I'm not so sure you really grasped this piece"
                    case 6:
                        reactionString = "I suppose these higher brow pieces aren't for everyone"
                    case 7:
                        reactionString = "That rating for this piece just doesn't add up "
                    case 8:
                        reactionString = "Some people really skipped art history class and it shows "
                    case 9:
                        reactionString = "There's an indescribable nature about this piece that certainely went over your head"
                    case 10:
                        reactionString = "Maybe we can agree for once "
                    case 11:
                        reactionString = "There's a childlike playfulness seen in the intricies here you may have missed it "
                    case 12:
                        reactionString = "The overall composition here is a change of pace from his earlier work "
                    case 13:
                        reactionString = "You really have to have studied the artist to appreciate this piece"
                    case 14:
                        reactionString = "Wow! you really think so?"
                    case 15:
                        reactionString = "That's a bit of an interesting opinion"
                    default:
                        reactionString = "Wow you are really good at programming in Swift" //should never output please
                    }
                switch number {
                    case 1:
                        reaction1.stringValue = reactionString
                    case 2:
                        reaction2.stringValue = reactionString
                    case 3:
                        reaction3.stringValue = reactionString
                    default:
                        print("Houston we got an indexing problem") //only will output if i messed something up
                    }
            
        }


        
      
        
        
    }
    
    
    func reportStatus(code: Int) {
        loadData(Int.random(in: 434_000..<440_000));

    }
    
    
    // Report the error directly to the user.
    func reportError(error: NSError) {
        DispatchQueue.main.async {
            let alert = NSAlert(error: error)
            alert.runModal()
        }
    }



}

