//
//  FirstViewController.swift
//  Enviroreboot
//
//  Created by Max Wray on 2/5/16.
//  Copyright © 2016 Max Wray. All rights reserved.
//

import UIKit
import CoreData
class FirstViewController: UIViewController {
    //accesses managed object context
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    // properties of first page
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var weatherTextField : UITextField!
    @IBOutlet var temperatureSlider : UISlider!
    @IBOutlet var stampPicker : UIDatePicker!
    @IBOutlet weak var waterslider: UISlider!
    @IBOutlet weak var Characteristics: UITextView!
    // lable that alerts user if their data is saved or not
    @IBOutlet weak var saved1: UILabel!
    // label that displays temperature
    @IBOutlet weak var watertemp: UILabel!
    var water1: Float = 0.0 //records water slider value
    //var water2: String = "" // stores water slider label data
    // label that displays air temperature
    @IBOutlet weak var airtemp: UILabel!
    
    var air1: Float = 0.0 // records air slider value
    // var air2 : String = "" // stores air slider label data
    //  override func viewDidLoad() {
    // super.viewDidLoad()
    //}
    
    @IBAction func totwo(sender: AnyObject) {
        //saves 1st page
        //creates entity description
        let entityDescription = NSEntityDescription.entityForName("Front", inManagedObjectContext: managedObjectContext)
        //first is an instance of the Front entity
        let first = Front(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        // attributes of fronts are set to current values in interface elements
        first.location = locationTextField.text!
        first.additional = Characteristics.text! //text is textfield property
        first.weather = weatherTextField.text!
        first.air = temperatureSlider.value // value is slider property
        first.water = waterslider.value
        first.stamp = stampPicker.date // date is date picker property
        do {
            // saves data
            try managedObjectContext.save()
            // alerts user
            saved1.text = "Entries have been saved"
        }
            // displays error message if entries are not saved
        catch let error as NSError {
            saved1.text = error.localizedFailureReason ; "please try again"
        }
    }
    // function that connects a label to a the water temperature slider so it can display the temp
    @IBAction func waterdisplay(sender: AnyObject) {
        water1 = waterslider.value // accesses water slider value as a float
        watertemp.text = "Water temperature \(water1)" //displays value in label
    }
    // allows label to display air temperature data from the slider
    @IBAction func airdisplay(sender: AnyObject) {
        air1 = temperatureSlider.value // acesses water slider value as a float
        airtemp.text = " Air temperature \(air1)" //displays value in label
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

