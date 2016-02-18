//
//  Page4ViewController.swift
//  Enviroreboot
//
//  Created by Max Wray on 2/5/16.
//  Copyright © 2016 Max Wray. All rights reserved.
//

import UIKit
import CoreData
class Page4ViewController: UIViewController {
// key id for this page
    var resultsID: Int?
    @IBOutlet weak var displayhealth: UILabel!
    @IBOutlet weak var displaytolerance: UILabel!
    
    // temporary variables to store index values
    var tretrieve: NSNumber = 0.0
    var hretrieve: NSNumber = 0.0
    
    //  tretrieve = viewcontroller2ViewController.ViewDidLoad(bugstracker)
    //  hretrieve = page3ViewController.ViewDidLoad(htracker)
    
    // fetches data from 3rd page
    // let request = NSFetchRequest(entityName:"Habitat")
    //  request.entity = entityDescription
    //   var error: NSError?
    // retrieves data in an array
    // var results = ManagedObjectContext?.executeFetchRequest(request,error: &error)
    //  let match = results[0] as! NSManagedObject
    //  let healthind = match.valueforKey("hindex") as! Double
    // displayhealth.text = "Health index is \(healthind)"
    func updateindexes(tretrieve:NSNumber, hretrieve:NSNumber) {
        displayhealth.text = "The Health Index for the stream's habitat is \(hretrieve)"
        displaytolerance.text = " The Tolerance Index for the stream is \(tretrieve)"
    }
    
    // this function saves all of the data from the entire application
    @IBAction func saveall(sender: AnyObject) {
        
    }
    
    // this function returns all of the elements to their default values
    @IBAction func newentry(sender: AnyObject) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // restores state of the view controller
    override func encodeRestorableStateWithCoder(coder: NSCoder) {
        // saves id for current view with encoder
        if let resultsID = resultsID {
            coder.encodeInteger(resultsID, forKey:"resultsID")
        }
        //calls super so inherited state functionality will occur
        super.encodeRestorableStateWithCoder(coder)
    }
    // decodes ID and sets it back to view Controller's ID property
    override func decodeRestorableStateWithCoder(coder: NSCoder) {
        resultsID = coder.decodeIntegerForKey("resultsID")
        super.decodeRestorableStateWithCoder(coder)
    }
    // completes restoration of view controller and restores view based on decoded ID
    override func applicationFinishedRestoringState() {
        guard let resultsID = resultsID else { return }
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
