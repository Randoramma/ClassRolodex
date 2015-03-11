//
//  PersonDetailViewController.swift
//  ClassRolodex
//
//  Created by Randy McLain on 3/10/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

    class PersonDetailViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

        @IBOutlet weak var firstNameLabel: UITextField!
        
        @IBOutlet weak var imageVIew: UIImageView!
        
        @IBOutlet weak var lastNameLabel: UITextField!

  var selectedPerson = Person(firstName: "Dummy", lastName:"Dummy")
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = self.selectedPerson.firstName
      self.firstNameLabel.delegate = self
      
      self.firstNameLabel.text = self.selectedPerson.firstName
      self.lastNameLabel.text = self.selectedPerson.lastName
      
    }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    self.selectedPerson.firstName = self.firstNameLabel.text
    self.selectedPerson.lastName = self.lastNameLabel.text
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
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    
    let image = info[UIImagePickerControllerOriginalImage] as UIImage
    self.imageVIew.image = image
    self.selectedPerson.image = image
    
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    picker.dismissViewControllerAnimated(true, completion: nil)
  }

}
