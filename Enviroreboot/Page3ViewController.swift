//
//  Page3ViewController.swift
//  Enviroreboot
//
//  Created by Max Wray on 2/5/16.
//  Copyright © 2016 Max Wray. All rights reserved.
//

import UIKit
import CoreData
class Page3ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    //accesses managed object context
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    //outlets for pickerviews
    @IBOutlet weak var picker1: UIPickerView! //watercolor
    var picker1data: [String] = [String]() //instance variable for picker1array
    var picker1selection: Double = 0.0 // assigns picker value to an integer
    @IBOutlet weak var picker2: UIPickerView!//bank erosion
    var picker2data: [String] = [String]() // picker2 array
    var picker2selection: Double = 0.0;
    @IBOutlet weak var picker3: UIPickerView!// bank vegetation
    var picker3data: [String] = [String]()
    var picker3selection: Double = 0.0;
    @IBOutlet weak var picker4: UIPickerView!//stream cover
    var picker4data: [String] = [String]()
    var picker4selection: Double = 0.0;
    @IBOutlet weak var picker5: UIPickerView!//water odor
    var picker5data: [String] = [String]()
    var picker5selection: Double = 0.0;
    @IBOutlet weak var picker6: UIPickerView!// bottom
    var picker6data: [String] = [String]()
    var picker6selection: Double = 0.0;
    @IBOutlet weak var picker7: UIPickerView!// flow level
    var picker7data: [String] = [String]()
    var picker7selection: Double = 0.0;
    @IBOutlet weak var picker8: UIPickerView!// variety
    var picker8data: [String] = [String]()
    var picker8selection: Double = 0.0;
    @IBOutlet weak var status3: UILabel!
    // outlets for labels
    @IBOutlet weak var waterpickerlabel: UILabel!
    @IBOutlet weak var erosionpickerlabel: UILabel!
    @IBOutlet weak var vegetationpickerlabel: UILabel!
    @IBOutlet weak var streamcoverpickerlabel: UILabel!
    @IBOutlet weak var odorpickerlabel: UILabel!
    @IBOutlet weak var bottompickerlabel: UILabel!
    @IBOutlet weak var flowlevelpickerlabel: UILabel!
    @IBOutlet weak var varietypickerlabel: UILabel!
    // variable that stores health index
    var healthindex: NSNumber = 0.0
    var selection1: Double = 0.0
    var selection2: Double = 0.0
    var selection3: Double = 0.0
    // array that stores data
    var htracker = [NSManagedObject]()
    // saves entries
    @IBAction func save3(sender: AnyObject) {
        // creates entity description
        let entityDescription = NSEntityDescription.entityForName("Habitat", inManagedObjectContext: managedObjectContext)
        // third is an instance of the Habitat entity
        let third = Habitat(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        // habitat attributes are set to labels and numerical picker values
        third.picker1label = waterpickerlabel.text!
        third.pick1value = picker1selection
        third.picker2label = erosionpickerlabel.text!
        third.pick2value = picker2selection
        third.picker3label = vegetationpickerlabel.text!
        third.pick3value = picker3selection
        third.picker4label = streamcoverpickerlabel.text!
        third.pick4value = picker4selection
        third.picker5label = odorpickerlabel.text!
        third.pick5value = picker5selection
        third.picker6label = bottompickerlabel.text!
        third.pick6value = picker6selection
        third.picker7label = flowlevelpickerlabel.text!
        third.pick7value = picker7selection
        third.picker8label = varietypickerlabel.text!
        third.pick8value = picker8selection
        // stores health index value
        third.hindex = healthindex
        // accesses attribute from nsmanaged context using key value coding
        healthindex = (Habitat.valueForKey("hindex") as? NSNumber!)!
        
        // saves data
        do {
            try managedObjectContext.save()
            status3.text = "Entries have been saved"
        }
        catch let error as NSError {
            status3.text = error.localizedFailureReason ; "please try again"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // configures pickerview delegate and datasource
        self.picker1.delegate = self //self.picker1 references picker1
        self.picker1.dataSource = self
        self.picker2.delegate = self
        self.picker2.dataSource = self
        self.picker3.delegate = self
        self.picker3.dataSource = self
        self.picker4.delegate = self
        self.picker4.dataSource = self
        self.picker5.delegate = self
        self.picker5.dataSource = self
        self.picker6.delegate = self
        self.picker6.dataSource = self
        self.picker7.delegate = self
        self.picker7.dataSource = self
        self.picker8.delegate = self
        self.picker8.dataSource = self
        // inputs data into arrays
        picker1data = ["Clear", "Green", "Muddy", "Black/Oily"]
        picker2data = ["None", "Small Soil Exposure", "Large soil and root Exposure","Full Exposure"]
        picker3data = ["Total Cover", "Sufficient Cover", "Half Cover", "Minimal Cover"]
        picker4data = ["Total Shade", "Partial Shade", "Mostly Sun", "Full Sun"]
        picker5data = ["None", "Earthy", "Rotten Eggs", "Sewage/Fishy"]
        picker6data = ["Large rocks no sediment", "Some rocks and sediment", "Mostly sediment", "no rocks"]
        picker7data = ["Bottom not exposed", "Bottom Partially Exposed", " Bottom Mostly Exposed", "No Rocks"]
        picker8data = ["Deep pools varied runs & riffles", "Shallow pools, runs & riffles", "only riffles and runs", "mostly runs"]
        
        // fetches data
        //accesses application delegate to obtain managed object context
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedcontext = appdelegate.managedObjectContext
        // fetch request
        let fetchrequest = NSFetchRequest(entityName: "Habitat")
        // filters request to return tolerance value
        let healthpredicate = NSPredicate(format:"hindex >=0")
        (htracker as NSArray).filteredArrayUsingPredicate(healthpredicate)
        do {
            let results = try managedcontext.executeFetchRequest(fetchrequest)
            htracker = results as! [NSManagedObject]
        } catch let error as NSError {
            print(" Could not fetch \(error), \(error.userInfo)")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // amount of columns of data for pickerview 1
    func numberOfComponentsInPickerView(picker1: UIPickerView) -> Int {
        return 1
    }
    // amount of rows in pickerview1
    func pickerView(picker1: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker1data.count //i used picker1 instead of reccomended pickerview in code
    }
    // returns data for the row and column thats accessed for picker1
    func pickerView(picker1: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker1data[row] // i used picker1 instead of reccomended pickerview in code
    }
    // detects the current selection for the first picker view
    func pickerView(picker1: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // triggered whenever the selection is changed
        // row and component represent whats detected
        // displays picker data to label so it can be saved
        waterpickerlabel.text = "Water Color \(picker1data[row]) "
        // assigns option to a numerical value
        if (row == 0) {
            picker1selection = 4.0;
        }
        if (row==1) {
            picker1selection = 3.0;
        }
        if (row==2) {
            picker1selection = 2.0;
        }
        if (row == 3) {
            picker1selection = 0.0;
        }
    }
    // amount of columns of data for pickerview 2
    func numberOfComponentsInPickerView2(picker2: UIPickerView) -> Int {
        return 1
    }
    // amount of rows in pickerview 2
    func pickerView2(picker2: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker2data.count //i used picker1 instead of reccomended pickerview in code
    }
    // returns data for the row and column thats accessed for picker2
    func pickerView2(picker2: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker2data[row] // i used picker1 instead of reccomended pickerview in code
    }
    // detects the current selection for the second picker view
    func pickerView2(picker2: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        erosionpickerlabel.text = "Bank Erosion \(picker2data[row])"
        // assigns option to a numerical value
        if (row == 0) {
            picker2selection = 4.0;
        }
        if (row==1) {
            picker2selection = 3.0;
        }
        if (row==2) {
            picker2selection = 2.0;
        }
        if (row == 3) {
            picker2selection = 0.0;
        }
    }
    // amount of columns of data for pickerview 3
    func numberOfComponentsInPickerView3(picker1: UIPickerView) -> Int {
        return 1
    }
    // amount of rows in pickerview3
    func pickerView3(picker3: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker3data.count //i used picker1 instead of reccomended pickerview in code
    }
    // returns data for the row and column thats accessed for picker3
    func pickerView3(picker3: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker3data[row] // i used picker1 instead of reccomended pickerview in code
    }
    // detects the current selection for the third picker view
    func pickerView3(picker3: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        vegetationpickerlabel.text = "Bank Vegetation \(picker3data[row])"
        // assigns option to a numerical value
        if (row == 0) {
            picker3selection = 4.0;
        }
        if (row==1) {
            picker3selection = 3.0;
        }
        if (row==2) {
            picker3selection = 2.0;
        }
        if (row == 3) {
            picker3selection = 0.0;
        }
    }
    // amount of columns of data for pickerview 4
    func numberOfComponentsInPickerView4(picker4: UIPickerView) -> Int {
        return 1
    }
    // amount of rows in pickerview 4
    func pickerView4(picker4: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker4data.count //i used picker1 instead of reccomended pickerview in code
    }
    // returns data for the row and column thats accessed for picker4
    func pickerView4(picker4: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker4data[row] // i used picker1 instead of reccomended pickerview in code
    }
    // detects the current selection for the fourth picker view
    func pickerView4(picker4: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        streamcoverpickerlabel.text = "Stream cover \(picker4data[row])"
        // assigns option to a numerical value
        if (row == 0) {
            picker4selection = 4.0;
        }
        if (row==1) {
            picker4selection = 3.0;
        }
        if (row==2) {
            picker4selection = 2.0;
        }
        if (row == 3) {
            picker4selection = 0.0;
        }
    }
    // amount of columns of data for pickerview 5
    func numberOfComponentsInPickerView5(picker5: UIPickerView) -> Int {
        return 1
    }
    // amount of rows in pickerview5
    func pickerView5(picker5: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker5data.count //i used picker1 instead of reccomended pickerview in code
    }
    // returns data for the row and column thats accessed for picker t
    func pickerView5(picker5: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker5data[row] // i used picker1 instead of reccomended pickerview in code
    }
    // detects the current selection for the fifth picker view
    func pickerView5(picker5: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        odorpickerlabel.text = "Water odor \(picker5data[row])"
        // assigns option to a numerical value
        if (row == 0) {
            picker5selection = 4.0;
        }
        if (row==1) {
            picker5selection = 3.0;
        }
        if (row==2) {
            picker5selection = 2.0;
        }
        if (row == 3) {
            picker5selection = 0.0;
        }
    }
    // amount of columns of data for pickerview 6
    func numberOfComponentsInPickerView6(picker6: UIPickerView) -> Int {
        return 1
    }
    // amount of rows in pickerview6
    func pickerView6(picker6: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker6data.count //i used picker1 instead of reccomended pickerview in code
    }
    // returns data for the row and column thats accessed for picker t
    func pickerView6(picker6: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker6data[row] // i used picker1 instead of reccomended pickerview in code
    }
    // detects the current selection for the fifth picker view
    func pickerView6(picker6: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        bottompickerlabel.text = "Stream bottom \(picker6data[row])"
        // assigns option to a numerical value
        if (row == 0) {
            picker6selection = 4.0;
        }
        if (row==1) {
            picker6selection = 3.0;
        }
        if (row==2) {
            picker6selection = 2.0;
        }
        if (row == 3) {
            picker6selection = 0.0;
        }
    }
    // amount of columns of data for pickerview 7
    func numberOfComponentsInPickerView7(picker7: UIPickerView) -> Int {
        return 1
    }
    // amount of rows in pickerview7
    func pickerView7(picker7: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker7data.count //i used picker1 instead of reccomended pickerview in code
    }
    // returns data for the row and column thats accessed for picker 7
    func pickerView7(picker7: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker7data[row] // i used picker1 instead of reccomended pickerview in code
    }
    // detects the current selection for the seventh picker view
    func pickerView7(picker7: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        flowlevelpickerlabel.text = "Flow level \(picker7data[row])"
        // assigns option to a numerical value
        if (row == 0) {
            picker7selection = 4.0;
        }
        if (row==1) {
            picker7selection = 3.0;
        }
        if (row==2) {
            picker7selection = 2.0;
        }
        if (row == 3) {
            picker7selection = 0.0;
        }
    }
    // amount of columns of data for pickerview 8
    func numberOfComponentsInPickerView8(picker8: UIPickerView) -> Int {
        return 1
    }
    // amount of rows in pickerview8
    func pickerView8(picker8: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker8data.count //i used picker1 instead of reccomended pickerview in code
    }
    // returns data for the row and column thats accessed for picker t
    func pickerView8(picker8: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker8data[row] // i used picker1 instead of reccomended pickerview in code
    }
    // detects the current selection for the fifth picker view
    func pickerView8(picker8: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        varietypickerlabel.text = "Habitat variety \(picker8data[row])"
        // assigns option to a numerical value
        if (row == 0) {
            picker8selection = 4.0;
        }
        if (row==1) {
            picker8selection = 3.0;
        }
        if (row==2) {
            picker8selection = 2.0;
        }
        if (row == 3) {
            picker8selection = 0.0;
        }
        func calculatehealthindex (picker1selection:Double, picker2selection:Double, picker3selection:Double, picker4selection:Double, picker5selection:Double, picker6selection:Double, picker7selection:Double, picker8selection: Double, var healthindex:Double, selection1: Double, selection2: Double, selection3: Double) {
            // intermediate variables
            let selection1 = picker1selection + picker2selection + picker3selection
            let selection2 = picker4selection + picker5selection + picker6selection
            let selection3 = picker7selection + picker8selection
            healthindex = (selection1 + selection2 + selection3)/8
        }
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
