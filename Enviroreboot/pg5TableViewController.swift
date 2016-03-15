//
//  pg5TableViewController.swift
//  Enviroreboot
//
//  Created by Max Wray on 3/3/16.
//  Copyright © 2016 Max Wray. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift
class pg5TableViewController: UITableViewController {
    
    // key ID for this page
    var recordsID: Int?
    // managed object context
    let managedObjectContext = (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    // temporary variables to store retrieved values
    var place : String = ""
    var getweather: String = ""
    var initial: String = ""
    var start: NSDate
    var airtemp: Float = 0.0
    var watertemp: Float = 0.0
    var tolfunction: Double = 0.0
    var healthfunction: Double = 0.0
    // arrays
    //stores retrieved front variables
    //var frontretrieved = [NSObject]()
    //bugs variables
    //var bugsretrieved = []
    //habitat variables
     //var habitatretrieved = []
    
    
    
    
    //fetching data
    let realm = try! Realm()
     var frontretrieved: Results<Front1> = { self.realm.objects(Front1) } ()
     var bugsretrieved: Results<bugs1> = {self.realm.objects(bugs1)}()
     var habitatretrieved: Results<Habitat1> = {self.realm.objects(Habitat1)}()

    override func viewDidLoad() {
    // populates array 
    //frontretrieved = [place, getweather, initial, start]
   // bugsretrieved = [tolfunction]
    //habitatretrieved = [healthfunction]
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
/*
    @IBAction func getrecords(sender: AnyObject) {
    // entity description
    let frontentityDescription = NSEntityDescription.entityForName("Front", inManagedObjectContext: managedObjectContext)
    let bugsentityDescription = NSEntityDescription.entityForName("Bugs", inManagedObjectContext: managedObjectContext)
    let habitatentityDescription = NSEntityDescription.entityForName("Habitat", inManagedObjectContext: managedObjectContext)
       // retrieves front data
    let frontrequest = NSFetchRequest()
    frontrequest.entity = frontentityDescription
    let frontpred = NSPredicate(format: "(location = %@)", Front.location)
    frontrequest.predicate = frontpred
    do {
        var frontresults = try managedObjectContext.executeFetchRequest(frontrequest)
        if frontresults.count > 0 {
            let frontmatch = frontresults[0] as! NSManagedObject
            //stores retrieved data to temporary values
            place = Front.location
            getweather = Front.weather
            initial = Front.additional
            start = Front.stamp
        }
    }
        // retrieves bugs data
        let bugsrequest = NSFetchRequest()
        bugsrequest.entity = bugsentityDescription
         let bugspred = NSPredicate(format: "(tolerance = %@)", Bugs.tolerance)
        bugsrequest.predicate = bugspred
        do {
            var bugsresults = try managedObjectContext.executeFetchRequest(bugsrequest)
            if bugsresults.count > 0 {
            let bugsmatch = bugsresults[0] as! NSManagedObject
            //stores retrieved data to temporary values
            tolfunction = Bugs.tolerance
            }
        }
    // retrieves habitat data
    let habitatrequest = NSFetchRequest()
    habitatrequest.entity = habitatentityDescription
    let habitatpred = NSPredicate(format: "(tolerance = %@)", Habitat.hindex)
    habitatrequest.predicate = habitatpred
    do {
        var habitatresults = try managedObjectContext.executeFetchRequest(habitatrequest)
        if habitatresults.count > 0 {
        let habitatmatch = habitatresults[0] as! NSManagedObject
        //stores retrieved data to temporary values
        healthfunction = Habitat.hindex
        }
    }
}
   */
    
    @IBAction func adddata(sender: AnyObject) {
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // restores state of the view controller
    override func encodeRestorableStateWithCoder(coder: NSCoder) {
        // saves id for current view with encoder
        if let recordsID = recordsID {
            coder.encodeInteger(recordsID, forKey:"recordsID")
        }
        //calls super so inherited state functionality will occur
        super.encodeRestorableStateWithCoder(coder)
    }
    // decodes ID and sets it back to view Controller's ID property
    override func decodeRestorableStateWithCoder(coder: NSCoder) {
        recordsID = coder.decodeIntegerForKey("recordsID")
        super.decodeRestorableStateWithCoder(coder)
    }
    // completes restoration of view controller and restores view based on decoded ID
    override func applicationFinishedRestoringState() {
        guard let recordsID = recordsID else { return }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return frontretrieved.count + bugsretrieved.count + habitatretrieved.count
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
