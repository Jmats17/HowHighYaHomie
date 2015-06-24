//
//  StartScreenViewController.swift
//  How High Ya Homie
//
//  Created by Justin Matsnev on 5/21/15.
//  Copyright (c) 2015 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit

class StartScreenViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePicker: UIImagePickerController!
    var imageView : UIImageView!
    
    
    @IBAction func snapAPic(sender : AnyObject) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func chooseAPic(sender : AnyObject) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
//        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
//        
//        self.dismissViewControllerAnimated(true, completion: nil)
//        let image1 = UIImageJPEGRepresentation(image, 9)
//        defaults.setObject(image1, forKey: "image")
//        defaults.synchronize()
//    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        let image2 = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        let image1 = UIImageJPEGRepresentation(image2, 1.0)
        defaults.setObject(image1, forKey: "image")
        defaults.synchronize()
        self.performSegueWithIdentifier("startToPic", sender: self)

    }
  
}