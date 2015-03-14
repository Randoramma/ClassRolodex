//
//  PersonDetailViewController.swift
//  ClassRolodex
//
//  Created by Randy McLain on 3/10/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

class PersonDetailViewController:  UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // properties
    
    //textLabel recording the first Name of the person.
    @IBOutlet weak var firstNameLabel: UITextField!
    
    //textLabel recording the last Name of the person.
    @IBOutlet weak var lastNameLabel: UITextField!
    
    //textLabel recording an image representation of the person.
    @IBOutlet weak var imageView: UIImageView!
    
    // instantiation of a person object to record the contact's properties.
    var selectedPerson = Person(firstName: "Dummy", lastName:"Dummy")
    
    // setup
    override func viewDidLoad() {
        super.viewDidLoad()
        // record the title of the VC based on the current contacts first name.
        title = self.selectedPerson.getFirstName()
        
        //
        firstNameLabel.delegate = self
        
        //if there is already an image for the current person object
        if selectedPerson.myImage != nil {
            // set the image view to that
            imageView.image = self.selectedPerson.myImage
            
        }// else do nothing.
        
    }
    
    // post setup
    override func viewWillAppear (animated: Bool) {
        
        firstNameLabel.text = self.selectedPerson.getFirstName()
        
        lastNameLabel.text = self.selectedPerson.getLastName()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        selectedPerson.myFirstName = self.firstNameLabel.text
        selectedPerson.myLastName = self.lastNameLabel.text
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //this line dismisses the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func photosButtonPressed(sender: AnyObject) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController (picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        imageView.image = image
        selectedPerson.myImage = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
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
