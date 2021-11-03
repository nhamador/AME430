//
//  ViewController.swift
//  SpaceX
//
//  Created by Loren Olson on 10/4/21.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet weak var tableView: NSTableView!
    
    @IBOutlet weak var serialField: NSTextField!
    @IBOutlet weak var statusField: NSTextField!
    @IBOutlet weak var lastUpdateField: NSTextField!
    
    @IBOutlet weak var launchesTableView: NSTableView!
    
    
    var tableHelper = TableHelper()
    var cores: [Core] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Prepare the launches tableview.
        tableHelper.tableView = launchesTableView
        launchesTableView.delegate = tableHelper
        launchesTableView.dataSource = tableHelper
        
        // request the cores data
        loadData()
    }
    
    
    
    func loadData() {
        let session = URLSession.shared
        
        // This is the URL to get information about all spacex cores.
        guard let url = URL(string:"https://api.spacexdata.com/v4/cores") else { return }
        
        // Prepare a session task that will send a request to the URL, and create a completion handler for the response.
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error as NSError? {
                // There was an error. Report it to the user, and done.
                print("***** Error *****")
                print(error)
                reportError(error: error)
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
                reportStatus(code: httpResponse.statusCode)
                return
            }
            
            // These two lines are useful for debugging during development
            print("***** Here is the HttpResponse: ******")
            print(httpResponse)
            
            // Unwrap the data object.
            guard let data = data else {
                print("failed to unwrap data?")
                return
            }
            
            // Decoding the data as a string and printing it to the console
            // is useful for debugging during development. It is not neccessary
            // for the program to work correctly!
            if let string = String(data: data, encoding: .utf8) {
                print("***** Here is the data as a string *****")
                print(string)
            }
            
            // Decode the JSON response.
            let decoder = JSONDecoder()
            
            // Since I decided to format the property names in CamelCase style,
            // it is neccessary to set the keyDecodingStrategy property.
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                self.cores = try decoder.decode([Core].self, from: data)
            }
            catch {
                print("*** json decode error")
                print(error)
            }
            
            // These two lines are useful for debugging during development
            print("***** Decoded String *****")
            print(self.cores.count)
            
            
            DispatchQueue.main.async {
                // Update the UI on the main thread.
                self.tableView.reloadData()
            }
            
        })
        
        // Send the request.
        task.resume()
    }

    
    // NSTableViewDataSource method - tell the Table how many items are in the list.
    func numberOfRows(in tableView: NSTableView) -> Int {
        return cores.count
    }
    
    // NSTableViewDataSource method - return a view for one row that can be seen on screen.
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let tc = tableColumn, let cell = tableView.makeView(withIdentifier: tc.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        
        cell.textField?.stringValue = cores[row].serial
        return cell
    }
    

    // NSTableViewDelegate method - the user selected a row in the table.
    func tableViewSelectionDidChange(_ notification: Notification) {
        
        let row = tableView.selectedRow
        
        // Update the fields for the "Detail infomation" about a core.
        serialField.stringValue = cores[row].serial
        statusField.stringValue = cores[row].status
        lastUpdateField.stringValue = cores[row].lastUpdate ?? "-"
        
        // Update the launches table
        tableHelper.launches = cores[row].launches
        launchesTableView.reloadData()
    }
    
    
    // prepare for the segue to display another NSViewController
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        let launchVC = segue.destinationController as? LaunchViewController
        let coreRow = tableView.selectedRow
        let launchRow = launchesTableView.selectedRow
        if coreRow >= 0 && launchRow >= 0 {
            // tell the LaunchViewController which launch the user
            // selected in the Launches tableview
            launchVC?.launchId = cores[coreRow].launches[launchRow]
        }
    }

}


// Report the status code to the user.
// In production, you should provide better info.
func reportStatus(code: Int) {
    DispatchQueue.main.async {
        let alert = NSAlert()
        alert.messageText = "HTTP Status Code \(code)"
        alert.informativeText = "The HTTP server returned an error status code."
        alert.alertStyle = .critical
        alert.addButton(withTitle: "Ok")
        alert.runModal()
    }
}


// Report the error directly to the user.
func reportError(error: NSError) {
    DispatchQueue.main.async {
        let alert = NSAlert(error: error)
        alert.runModal()
    }
}
