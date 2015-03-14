//
//  Person.swift
//
//
//  Created by Randy McLain on 3/6/15.
//
//
// Foundation is the library like the ACM in JAVA
import Foundation
import UIKit


// must be a subclass of NSObject to be NSCoding compliant.
class Person : NSObject, NSCoding{
    
    // properties
    // the first name of the person object.
    var myFirstName : String = "John"
    
    // the last name of the person object.
    var myLastName = "Doe"
    
    // the stored UIImage for rhis person object.
    var myImage : UIImage?
    
    
    // constructors
    
    // constructor for Person taking in firstName, lastName, and Student Status.
    init (firstName : String, lastName : String) {
        
        // initialize the properties with these constructor parameters.
        myFirstName = firstName
        myLastName = lastName
        
    } // init
    
    // required constructor of a NSCoder subclass with its biolerplate
    required init (coder aDecoder: NSCoder) {
        
        myFirstName = aDecoder.decodeObjectForKey("myFirstName") as String
        
        
        myLastName = aDecoder.decodeObjectForKey("myLastName") as String
        
        
        if let image = aDecoder.decodeObjectForKey ("myImage") as? UIImage {
            myImage = image
        }
        
    } // required init
    
    // required to encode the properties with archiver code into their Dictionaries for device storage
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(myFirstName, forKey: "firstName")
        aCoder.encodeObject(myLastName, forKey: "lastName")
        if myImage != nil {
            aCoder.encodeObject(myImage, forKey: "image")
        }
    }
    
    // method returning the Person object first name property.
    func getFirstName () -> String {
        return myFirstName
    } // getFirstName
    
    // method returning the Person object last name property.
    func getLastName() -> String {
        return myLastName
    } // getLastName
    
    // method returning a string object witht the persons first and last names.
    func toString() -> String {
        return "First: \(getFirstName()). Last:  \(getLastName())."
        
    } //toString
    
    
}

