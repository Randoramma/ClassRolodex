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
    
    // the first name of the person object.
    var myFirstName : String = "John"
    // the last name of the person object.
    
    var myLastName = "Doe"
    
    
    
    var myImage : UIImage?
    
    
    
    // constructor for Person taking in firstName, lastName, and Student Status.
    init (firstName : String, lastName : String) {
        
        // reinitialize the properties with the constructor parameters.
        self.myFirstName = firstName
        self.myLastName = lastName

    }

    // method returning the Person object first name property.
    func getFirstName () -> String {
        return myFirstName
    }
    
    // method returning the Person object last name property.
    func getLastName() -> String {
        return myLastName
    }
    
    // method returning a string object witht the persons first and last names.
    func toString() -> String {
        return "First: \(getFirstName()). Last:  \(getLastName())."
        
    }
    
    required init (coder aDecoder: NSCoder) {
        self.myFirstName = aDecoder.decodeObjectForKey("myFirstName") as String
        
        
        self.myLastName = aDecoder.decodeObjectForKey("myLastName") as String
 
        
        if let image = aDecoder.decodeObjectForKey ("myImage") as? UIImage {
            
        }
        
        
    }
    
    
    func func encodeWithCoder(aCoder: NSCoder) {
        
    }
    
    
    
    
}

