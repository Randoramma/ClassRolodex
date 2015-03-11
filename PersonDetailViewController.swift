//
//  PersonDetailViewController.swift
//  ClassRolodex
//
//  Created by Randy McLain on 3/10/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

class PersonDetailViewController:  UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedPerson = Person(firstName: "Dummy", lastName:"Dummy")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.selectedPerson.getFirstName()
        self.firstNameLabel.delegate = self
        
        if self.selectedPerson.myImage != nil {
            self.imageView.image
         = self.selectedPerson.myImage
            
        }
        
    }
    
    override func viewWillAppear (animated: Bool) {
        
        firstNameLabel.text = self.selectedPerson.getFirstName()
        
        lastNameLabel.text = self.selectedPerson.getLastName()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.selectedPerson.myFirstName = self.firstNameLabel.text
        self.selectedPerson.myLastName = self.lastNameLabel.text
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
        self.imageView.image = image
        self.selectedPerson.myImage = image
        
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
