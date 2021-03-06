//
//  Page4ViewController.swift
//  Enviroreboot
//
//  Created by Max Wray on 2/5/16.
//  Copyright © 2016 Max Wray. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift
class Page4ViewController: UIViewController {
// key id for this page
    var resultsID: Int?
    //outlets
    @IBOutlet weak var displayhealth: UILabel!
    @IBOutlet weak var displaytolerance: UILabel!
    @IBOutlet weak var saveproject: UILabel!
    //accesses managed object context
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    // temporary variables to store index values
   //lazy var tretrieve: Double = 0.0
  // lazy var hretrieve: Double = 0.0
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
    func updateindexes(gett:String) {
        displayhealth.text = "\(gett)"
        /*
        let realm = try! Realm()
        let predicatet = NSPredicate(format: "tolerance >= 0.0")
        let predicateh = NSPredicate(format: "health != -1")
        tretrieve = realm.objects(bugs1).filter(predicatet)
        hretrieve = realm.objects(Habitat1).filter(predicateh)
        displayhealth.text = "The Health Index for the stream's habitat is \(hretrieve)"
        displaytolerance.text = " The Tolerance Index for the stream is \(tretrieve)"
        */
    }
    
    // this function saves all of the data from the entire application
    @IBAction func saveall(sender: AnyObject) {
        /*
        let entityDescription = NSEntityDescription.entityForName("Habitat", inManagedObjectContext: managedObjectContext)

        let request = NSFetchRequest(entityName:"Habitat")
         request.entity = entityDescription
        //fetch request to retrieve data
        let pred = NSPredicate(format: "(hindex = %@)", hindex.Double!)
        request.predicate = pred

        // retrieves data in an array
         var results = managedObjectContext.executeFetchRequest(request,error: &error)
         let match = results[0] as! NSManagedObject
          let healthind = match.valueforKey("hindex") as! Double
         displayhealth.text = "Health index is \(healthind)"
        do {
            // saves data
            try managedObjectContext.save()
            // alerts user
            saveproject.text = "Entries have been saved"
        }
            // displays error message if entries are not saved
        catch let error as NSError {
            saveproject.text = error.localizedFailureReason ; "please try again"
        }
*/
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
