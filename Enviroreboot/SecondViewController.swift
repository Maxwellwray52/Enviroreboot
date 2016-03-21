//
//  SecondViewController.swift
//  Enviroreboot
//
//  Created by Max Wray on 2/5/16.
//  Copyright © 2016 Max Wray. All rights reserved.
//

import UIKit
import CoreData
import MobileCoreServices
import RealmSwift
class SecondViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate, UITextInputTraits {
    // outlets
    @IBOutlet weak var amount1: UILabel!
    @IBOutlet weak var step1: UIStepper!
    @IBOutlet weak var step2: UIStepper!
    @IBOutlet weak var amount2: UILabel!
    @IBOutlet weak var step3: UIStepper!
    @IBOutlet weak var amount3: UILabel!
    @IBOutlet weak var step4: UIStepper!
    @IBOutlet weak var amount4: UILabel!
    @IBOutlet weak var step5: UIStepper!
    @IBOutlet weak var amount5: UILabel!
    @IBOutlet weak var step6: UIStepper!
    @IBOutlet weak var amount6: UILabel!
    @IBOutlet weak var step7: UIStepper!
    @IBOutlet weak var amount7: UILabel!
    @IBOutlet weak var step8: UIStepper!
    @IBOutlet weak var amount8: UILabel!
    @IBOutlet weak var step9: UIStepper!
    @IBOutlet weak var amount9: UILabel!
    @IBOutlet weak var step10: UIStepper!
    @IBOutlet weak var amount10: UILabel!
    @IBOutlet weak var step11: UIStepper!
    @IBOutlet weak var amount11: UILabel!
    @IBOutlet weak var step12: UIStepper!
    @IBOutlet weak var amount12: UILabel!
    @IBOutlet weak var step13: UIStepper!
    @IBOutlet weak var amount13: UILabel!
    @IBOutlet weak var step14: UIStepper!
    @IBOutlet weak var amount14: UILabel!
    @IBOutlet weak var step15: UIStepper!
    @IBOutlet weak var amount15: UILabel!
    @IBOutlet weak var step16: UIStepper!
    @IBOutlet weak var amount16: UILabel!
    @IBOutlet weak var step17: UIStepper!
    @IBOutlet weak var amount17: UILabel!
    @IBOutlet weak var tdisplay: UILabel!
    
    // keyboard type 
 /*var keyboardType: UIKeyboardType {
    get {
        return amount1.keyboardType
    }
    set {
     self.keyboardType = UIKeyboardType.NumberPad
    }
    } */
// Key ID for this page
    var MacroorganismID: Int?
    //accesses managed object context
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    // outlets for images
   /* @IBOutlet weak var image1: UIImageView!//stonefly
    @IBOutlet weak var image2: UIImageView!//caddisfly
    @IBOutlet weak var image3: UIImageView!//beetle larvae
    @IBOutlet weak var image4: UIImageView!//mayfly
    @IBOutlet weak var image5: UIImageView!//water penny
    @IBOutlet weak var image6: UIImageView!//damsel fly
    @IBOutlet weak var image7: UIImageView!//dragon fly
    @IBOutlet weak var image8: UIImageView!//crane fly
    @IBOutlet weak var image9: UIImageView!//fingernail clam
    @IBOutlet weak var image10: UIImageView!//freshwater snail
    @IBOutlet weak var image11: UIImageView!//blackfly
    @IBOutlet weak var image12: UIImageView!//scud
    @IBOutlet weak var image13: UIImageView!//crayfish
    @IBOutlet weak var image14: UIImageView!//aquatic sowbug
    @IBOutlet weak var image15: UIImageView!//aquatic worm
    @IBOutlet weak var image16: UIImageView!//midge
   */
 //   @IBOutlet weak var image17: UIImageView!//tubifex worm
    // outlets for textviews
  /* @IBOutlet weak var amount1: UITextField!//stonefly
    @IBOutlet weak var amount2: UITextField!//caddisfly
    @IBOutlet weak var amount3: UITextField!//beetle larvae
    @IBOutlet weak var amount4: UITextField!//mayfly
    @IBOutlet weak var amount5: UITextField!//water penny
    @IBOutlet weak var amount6: UITextField!//damsel fly
    @IBOutlet weak var amount7: UITextField!// dragon fly
    @IBOutlet weak var amount8: UITextField!//crane fly
    @IBOutlet weak var amount9: UITextField!// fingernail clam
    @IBOutlet weak var amount10: UITextField!// freshwater snail
    @IBOutlet weak var amount11: UITextField!// blackfly
    @IBOutlet weak var amount12: UITextField!//scud
    @IBOutlet weak var amount13: UITextField!//crayfish
    @IBOutlet weak var amount14: UITextField!//aquatic sowbug
    @IBOutlet weak var amount15: UITextField!//aquatic worm
    @IBOutlet weak var amount16: UITextField!//midge
   */ //@IBOutlet weak var amount17: UITextField!//tubifex worm
    // outlet for save label
    @IBOutlet weak var saved2: UILabel!
    // variables that convert bug amount text to int
    var b1: Double = 0.0
    var b2: Double = 0.0
    var b3: Double = 0.0
    var b4: Double = 0.0
    var b5: Double = 0.0
    var b6: Double = 0.0
    var b7: Double = 0.0
    var b8: Double = 0.0
    var b9: Double = 0.0
    var b10: Double = 0.0
    var b11: Double = 0.0
    var b12: Double = 0.0
    var b13: Double = 0.0
    var b14: Double = 0.0
    var b15: Double = 0.0
    var b16: Double = 0.0
    var b17: Double = 0.0
    // intermediate variables
    var sensitive1: Double = 0.0
    var sensitive2: Double = 0.0
    var semisensitive1: Double = 0.0
    var semisensitive2: Double = 0.0
    var semitolerant1: Double = 0.0
    var semitolerant2: Double = 0.0
    var tolerant1: Double = 0.0
    var tolerant2: Double = 0.0
    // variable that stores tolerance value
    var Tindex: Double = 0.0
    // array for tolerance index
    //var ttracker: [Int] = []
    // array that stores data
    var bugstracker = [NSManagedObject]()
    // imageview that displays unknown organism
    @IBOutlet weak var mysterybug: UIImageView!
    // determines if images are new or old
    var newMedia: Bool?
    // updates labels 
    @IBAction func step1value(sender: AnyObject) {
        amount1.text = " \(Int(step1.value).description)"
        var a: String = ""
        a = amount1.text!
    }
    @IBAction func step2value(sender: AnyObject) {
         amount2.text = " \(Int(step2.value).description)"
        var a2: String = ""
        a2 = amount2.text!
        tdisplay.text = " \(a2)"
    }
    @IBAction func step3value(sender: AnyObject) {
         amount3.text = " \(Int(step3.value).description)"
    }
    @IBAction func step4value(sender: AnyObject) {
         amount4.text = " \(Int(step4.value).description)"
    }
    @IBAction func step5value(sender: AnyObject) {
         amount5.text = " \(Int(step5.value).description)"
    }
    @IBAction func step6value(sender: AnyObject) {
         amount6.text = " \(Int(step6.value).description)"
    }
    @IBAction func step7value(sender: AnyObject) {
         amount7.text = " \(Int(step7.value).description)"
    }
    @IBAction func step8value(sender: AnyObject) {
         amount8.text = " \(Int(step8.value).description)"
    }
    @IBAction func step9value(sender: AnyObject) {
         amount9.text = " \(Int(step9.value).description)"
    }
    @IBAction func step10value(sender: AnyObject) {
         amount10.text = " \(Int(step10.value).description)"
    }
    @IBAction func step11value(sender: AnyObject) {
         amount11.text = " \(Int(step11.value).description)"
    }
    @IBAction func step12value(sender: AnyObject) {
         amount12.text = " \(Int(step12.value).description)"
    }
    @IBAction func step13value(sender: AnyObject) {
         amount13.text = " \(Int(step13.value).description)"
    }
    @IBAction func step14value(sender: AnyObject) {
         amount14.text = " \(Int(step14.value).description)"
    }
    @IBAction func step15value(sender: AnyObject) {
         amount15.text = "\(Int(step15.value).description)"
    }
    @IBAction func step16value(sender: AnyObject) {
         amount16.text = " \(Int(step16.value).description)"
    }
    @IBAction func step17value(sender: AnyObject) {
         amount17.text = " \(Int(step17.value).description)"
    }
   
 
    
    // stores bugs1 object
    var bugsdata: bugs1!
    // saves attributes to bugs object
    func addbugs1() {
        let realm = try! Realm() // creates realm instance
        try! realm.write { // creates write transition
            let bugscomponents = bugs1() // creates an instance of bugs 1
            bugscomponents.m1 = self.step1.value
          //  b1 = Double(step1.value)
            bugscomponents.m2 = self.step2.value
            b2 = Double(step2.value)
            bugscomponents.m3 = self.step3.value
            b3 = self.step3.value
            bugscomponents.m4 = self.step4.value
            b4 = self.step4.value
            bugscomponents.m5 = self.step5.value
            b5 = self.step5.value
            bugscomponents.m6 = self.step6.value
            b6 = self.step6.value
            bugscomponents.m7 = self.step7.value
            b7 = self.step7.value
            bugscomponents.m8 = self.step8.value
            b8 = self.step8.value
            bugscomponents.m9 = self.step9.value
            b9 = self.step9.value
            bugscomponents.m10 = self.step10.value
            b10 = self.step10.value
            bugscomponents.m11 = self.step11.value
            b11 = self.step11.value
            bugscomponents.m12 = self.step12.value
            b12 = self.step12.value
            bugscomponents.m13 = self.step13.value
            b13 = self.step13.value
            bugscomponents.m14 = self.step14.value
            b14 = self.step14.value
            bugscomponents.m15 = self.step15.value
            b15 = self.step15.value
            bugscomponents.m16 = self.step16.value
            b16 = self.step16.value
            bugscomponents.m17 = self.step17.value
            b17 = self.step17.value
           bugscomponents.tolerance = self.Tindex
            realm.add(bugscomponents) // adds frontcomponents to realm
            self.bugsdata = bugscomponents // assigns frontcomponents to frontdata property
        }
    }

    
    // action for saved entries button
    @IBAction func savedtwo(sender: AnyObject) {
        /*
        // creates entity description
       let entityDescription = NSEntityDescription.entityForName("Bugs", inManagedObjectContext: managedObjectContext)
        // second is an instance of the bugs identity
        let second = Bugs(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        // attributes are set to values of the textfields
        second.bug1 = amount1.text!
        b1 = Int(second.bug1!)!
        second.bug2 = amount2.text!
        b2 = Int(second.bug2!)!
        second.bug3 = amount3.text!
        b3 = Int(second.bug3!)!
        second.bug4 = amount4.text!
        b4 = Int(second.bug4!)!
        second.bug5 = amount5.text!
        b5 = Int(second.bug5!)!
        second.bug6 = amount6.text!
        b6 = Int(second.bug6!)!
        second.bug7 = amount7.text!
        b7 = Int(second.bug7!)!
        second.bug8 = amount8.text! // text is a textfield property
        b8 = Int(second.bug8!)!
        second.bug9 = amount9.text!
        b9 = Int(second.bug9!)!
        second.bug10 = amount10.text!
        b10 = Int(second.bug10!)!
        second.bug11 = amount11.text!
        b11 = Int(second.bug11!)!
        second.bug12 = amount12.text!
        b12 = Int(second.bug12!)!
        second.bug13 = amount13.text!
        b13 = Int(second.bug13!)!
        second.bug14 = amount14.text!
        b14 = Int(second.bug14!)!
        second.bug15 = amount15.text!
        b15 = Int(second.bug15!)!
        second.bug16 = amount16.text!
        b16 = Int(second.bug16!)!
        second.bug17 = amount17.text!
        b17 = Int(second.bug17!)!
        // saves tolerance index
        second.tolerance = Tindex
        // accesses attribute from nsmanaged context using key value coding
        //T index = (Bugs.valueForKey("tolerance") as? NSNumber!)!
        // saves Tindex into array
        //ttracker[0] = Tindex
        // saves data
*/
        do {
            
            try managedObjectContext.save()
            //informs user of when entries are saved
            saved2.text = "Entries have been saved"
        }
        catch let error as NSError {
            // informs user if entries are not saved
            saved2.text = error.localizedFailureReason;  "please try again"
        }
    }
    // Calculates tolerance index
    func calculatetolerance(b1:Double,b2:Double,b3:Double,b4:Double,b5:Double,b6:Double,b7:Double, b8:Double, b9:Double, b10:Double,b11:Double, b12:Double,b13:Double,b14:Double, b15:Double,b16:Double, b17:Double) {
        // variables that calculate index for each group
        // several intermediate variables were recorded as xcode cannot handle arithmetic operations with many quantities
        //first 9 organisms are sensitive
        let sensitive1 = 1*(b1+b2)
        /*let sensitive2 = 1*(b3+b4)
        // next 6 organisms are semisensitive and are mutilplied by 2
        let semisensitive1 = 2*(b5+b6+b7)
        let semisensitive2 = 2*(b8+b9)
        // next 6 organisms are semitolerant and are multiplied by 3
        let semitolerant1 = 3*(b10+b11)
        let semitolerant2 = 3*(b12+b13)
        // last 6 oganisms are tolerant and are multiplied by 4
        let tolerant1 = 4*(b14+b15)
        let tolerant2 = 4*(b16+b17)
        */// tolerance index is the sum of the groups divided by 27 organisms
        Tindex = sensitive1
        //tdisplay.text = "The tolerance index is \(Tindex)"
    }
    
    //loads camera to take pictures of unknown organisms
    @IBAction func unknown(sender: AnyObject) {
        // checks if device has a camera
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            //assigns delegate
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            // defines media source as camera
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            // array that stores media
            imagePicker.mediaTypes = [kUTTypeImage as String] // media is images only
            imagePicker.allowsEditing = false // no editing allowed
            // still images only
            self.presentViewController(imagePicker, animated: true, completion: nil)
            newMedia = true // images are new and not from the library
        }
    }
    // accesses camera library
    @IBAction func getlibrary(sender: AnyObject) {
        //checks if device has a library
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum)
        {
            // assigns delegate
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            // defines media source as library
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            // array stores media
            imagePicker.mediaTypes = [kUTTypeImage as String] // media is images only
            imagePicker.allowsEditing = false // no editing
            // still images only
            self.presentViewController(imagePicker, animated: true, completion: nil)
            newMedia = false // images are old and from library
        }
    }
    // configures didFinishPickingMediaWithInfo this is called when image is taken and selected
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        self.dismissViewControllerAnimated(true, completion: nil)
        if mediaType.isEqualToString(kUTTypeImage as String) {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            mysterybug.image = image
            if (newMedia == true) {
                UIImageWriteToSavedPhotosAlbum(image, self, "image:didFinishSavingWithError:contextInfo", nil)
            }
        }
    }
    // dismisses image picker view and creates an alert for unsaved images and cancel button
    func image(image: UIImage, didFinishSavingWithError error:NSErrorPointer, contextInfo:UnsafePointer<Void>) {
        if error != nil {
            let alert = UIAlertController(title: "Save Failed", message: "Failed to save image", preferredStyle:UIAlertControllerStyle.Alert)
            let cancelAction = UIAlertAction(title: "OK", style:.Cancel, handler: nil)
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated:true, completion:nil)
        }
    }
    // cancels imagepicking session without saving or taking a pic
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    // uploads images to respective image views code obtained from ios8cookbook safaribooksonline
  /* var stoneflypic = UIImage(named: "stonefly") // variable to access picture of stonefly from my computer
    var image1 = UIImageView(image: stoneflypic)
    var caddisflypic = UIImage(named: "caddisfly")
    var image1 = UIImageView(image: caddisflypic)
    var blarvaepic = UIImage(named: "beetlelarvae")
    var mayflypic = UIImage(named: "mayfly")
    var waterpennypic = UIImage(named: "waterpenny")
    var damselflypic = UIImage(named: "damsel fly")
    var dragonflypic = UIImage(named: " dragon fly")
    var craneflypic = UIImage(named: "Cranefly")
    var clampic = UIImage(named: "Fingernail Clam")
    var snailpic = UIImage(named: "watersnail")
    var blackflypic = UIImage(named: "black fly")
    var scudpic = UIImage(named: "Scud")
    var crayfishpic = UIImage(named: "Crayfish")
    var sowbugpic = UIImage(named: "Aquatic sowbug")
    var aquaticwormpic = UIImage(named: "Aquaticworm")
    var midgepic = UIImage(named: "midge")
   var tubifexpic = UIImage(named: "tubifexworm")
   */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
       /* amount1.delegate = self
       amount1.keyboardType = UIKeyboardType .NumberPad ;
        amount2.delegate = self
        amount3.delegate = self
        amount4.delegate = self
        amount5.delegate = self
        amount6.delegate = self
        amount7.delegate = self
        amount8.delegate = self
        amount9.delegate = self
        amount10.delegate = self
        amount11.delegate = self
        amount12.delegate = self
        amount13.delegate = self
        amount14.delegate = self
        amount15.delegate = self
        amount16.delegate = self
        amount17.delegate = self
*/

       /* image1.image = stoneflypic // image view is populated with stone fly picture
        image1.addSubview(image1) // displays stonefly picture on second page
        // view.addSubview was changed to image1.addSubview
        image2.image = caddisflypic
        image2.addSubview(image2)
        image3.image = blarvaepic
        image3.addSubview(image3)
        image4.image = mayflypic
        image4.addSubview(image4)
        image5.image = waterpennypic
        image5.addSubview(image5)
        image6.image = damselflypic
        image6.addSubview(image6)
        image7.image = dragonflypic
        image7.addSubview(image7)
        image8.image = craneflypic
        image8.addSubview(image8)
        image9.image = clampic
        image9.addSubview(image9)
        image10.image = snailpic
        image10.addSubview(image10)
        image11.image = blackflypic
        image11.addSubview(image11)
        image12.image = scudpic
        image12.addSubview(image12)
        image13.image = crayfishpic
        image13.addSubview(image13)
        image14.image = sowbugpic
        image14.addSubview(image14)
        image15.image = aquaticwormpic
        image15.addSubview(image15)
        image16.image = midgepic
        image16.addSubview(image16)
        image17.image = tubifexpic
        image17.addSubview(image17)
        */
        // fetches data
        //accesses application delegate to obtain managed object context
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
       let managedcontext = appdelegate.managedObjectContext
        // fetch request
        let fetchrequest = NSFetchRequest(entityName: "Bugs")
        // filters request to return tolerance value
        let tolerancepredicate = NSPredicate(format:"tolerance >=0")
        (bugstracker as NSArray).filteredArrayUsingPredicate(tolerancepredicate)
        do {
            let results = try managedcontext.executeFetchRequest(fetchrequest)
            bugstracker = results as! [NSManagedObject]
        } catch let error as NSError {
            print(" Could not fetch \(error), \(error.userInfo)")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // restores state of the view controller
    override func encodeRestorableStateWithCoder(coder: NSCoder) {
        // saves id for current view with encoder
        if let MacroorganismID = MacroorganismID {
            coder.encodeInteger(MacroorganismID, forKey:"MacroorganismID")
        }
        //calls super so inherited state functionality will occur
        super.encodeRestorableStateWithCoder(coder)
    }
    // decodes ID and sets it back to view Controller's ID property
    override func decodeRestorableStateWithCoder(coder: NSCoder) {
        MacroorganismID = coder.decodeIntegerForKey("MacroorganismID")
        super.decodeRestorableStateWithCoder(coder)
    }
    // completes restoration of view controller and restores view based on decoded ID
    override func applicationFinishedRestoringState() {
        guard let MacroorganismID = MacroorganismID else { return }
    }
}

