//
//  ViewController.swift
//  ClassRolodex
//
//  Created by Randy McLain on 3/6/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.


import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // properties
    
    // instantiate the the array.
    var myContacts = [Person]()
    
    // out storyboard table reference
    @IBOutlet weak var myMainTableView: UITableView!
    
    // setup
    override func viewDidLoad() {
        super.viewDidLoad()
        // added a title to the table view page.
        self.title = "Home"
        self.myMainTableView.dataSource = self
        
        // setting up the user default basic preferences forin the NSDefaultslibrary.
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        /*
        This if let statement keeps track of the number of times the app has been
        launched by our user.  Th sets the temp constant "count" to what ever the
        current count is in the NSUserDefaults library and then increments a new
        constant by 1 (this is a numeric object ket (we couldnt get the int to work).
        
        If this is the first launch of the app, we set the launch count to 1 and print
        to console "first launch".  We then store the count object into the NSUserDefaults.
        */
        if let count = userDefaults.objectForKey("launchCount") as? Int {
            let newCount = count + 1
            userDefaults.setObject(newCount, forKey: "launchCount")
            
            // load this view Controller archive data file from memor
            
        } else {
            let count = 1
            userDefaults.setObject(count, forKey: "launchCount")
        }
        
        // now is a good time to save the current status to the Archive Doc.
        userDefaults.synchronize()
        
        self.loadFromArchive()
        
        // populate the contacts list array
        if self.myContacts.isEmpty {
            
            /* optional binding at work also known as an "if let"
            We search the main bundle for our plist File entitled People.plist where we can find our prebuilt
            array of people dictionaries containing their data (firstName, lastName) and then make a person
            object based on that information for each Dictionary object in the plist.  We then append the
            newly created person object to the end of the array.
            */
            
            if let filePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist") {
                
                if let plistArray = NSArray(contentsOfFile: filePath) {
                    
                    /*
                    Note: The keys from the dictionary you are pulling the data from must
                    match exactly the property names you are instantiating for the new
                    object you are creating or else the imported object info will not
                    be transferred.
                    */
                    for personObject in plistArray {
                        if let personDictionary = personObject as? NSDictionary {
                            let firstName = personDictionary["firstName"] as String
                            let lastName = personDictionary["lastName"] as String
                            let person = Person(firstName: firstName, lastName: lastName)
                            self.myContacts.append(person)
                        }// if let into Plist.
                    }// for in loop
                    
                }// if let going through populated plist.
                
            }//if let
            
            // save our prebuilt list of contacts to the archive.
            self.saveToArchive()
        }
        else {
            
        } // if self array is empty
    } // viewDidLoad
    
    // lifecycle function occuring
    override func viewWillAppear (animated : Bool) {
        super.viewWillAppear(animated)
        self.saveToArchive()
        self.myMainTableView.reloadData()
        
        
    }// viewWillAppear
    
    
    // how many rows to prepare in the table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // return the number of rows to the tableView.
        return self.myContacts.count
    }
    
    // what is to be placed in a cell for the table view.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // label the reuse indentifer with the name of the first cell in the table.
        
        //step 1 dequeue an available cell
        // the string is the identifier from the cell we added to the table in the storyboard.
        // "as" casts the cell object as a UITableViewCell
        let cell = self.myMainTableView.dequeueReusableCellWithIdentifier("myFirstCell", forIndexPath: indexPath) as PersonCell
        
        // will need to cast this as a PersonCell.
        
        // step 2 give me the Person object at the index (whatever index we are at) and assign it to a person placeholder
        
        let thePersonToDisplay = myContacts[indexPath.row]
        
        // assign the information to the cell from the temp Person object.
        cell.myCellFirstName.text = thePersonToDisplay.getFirstName()
        
        // assign the information to the cell from the temp Person object.
        cell.myCellLastName.text = thePersonToDisplay.getLastName()

        
        /* This is a logic sequence to determine if the Person has an image attached to it
        * then reveal that image in the tableview, otherwise if there is no image currently
        * attached to the Person object use the default image.  *** reset to the silouette.
        */
        if thePersonToDisplay.myImage != nil {
            cell.myCellImageView.image = thePersonToDisplay.myImage
        } else {
            cell.myCellImageView.image = UIImage(named: "profile_placeholder.png")
        }
        // return the cell.
        
        return cell
    } // tableView cellForRowAtIndex
    
    // method providing activity occuring just prior to segue with PDVC.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "UIStoryboardSegue" {
            
            let destinationVC = segue.destinationViewController as PersonDetailViewController
            // sets the color for the background image to green.
            //destinationVC.view.backgroundColor = UIColor.greenColor()
            
            
            //asking the table view for the selected index path, because we need to know which row they clicked on
            let indexPath = self.myMainTableView.indexPathForSelectedRow()
            //figures out which person they clicked on
            let person = self.myContacts[indexPath!.row]
            //passing the person to our destination view controller
            destinationVC.selectedPerson = person
            destinationVC.title = person.getFirstName()
        }
    } // prepareForSegue
    
    // method to pull Contacts list plist file from the Archive Doc
    func loadFromArchive() {
        // finding the path for where the archive file is currently located.
        let path = getDocumentsPath()
        // pull out the array from the plist as an array of Persons
        
        
        // using optional binding to pull the list of Persons from the archive file into the temporary variable.  We downcast this to a person
        // object and attempt to (if available) append this to our contacts file.
        if let arrayFromArchive: Person = NSKeyedUnarchiver.unarchiveObjectWithFile (path + "/MyArchive") as? Person {
            // set our array iteration of persons to equal the archive list.
            self.myContacts.append(arrayFromArchive)
        }
        
    } // loadFromArchive
    
    // method to save the current list of contacts to the Archive Doc.
    func saveToArchive() {
        // finding the path for where the archive file is currently located.
        let path = self.getDocumentsPath()
        
        // what is the plist object we will make and rename it here..
        NSKeyedArchiver.archiveRootObject(self.myContacts, toFile: path + "/myArchive")
    } // saveToArchive
    
    //
    func getDocumentsPath() -> String {
        let paths =
        NSSearchPathForDirectoriesInDomains (NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        let path = paths.first as String
        return path
        
    } // getDocumentsPath
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

