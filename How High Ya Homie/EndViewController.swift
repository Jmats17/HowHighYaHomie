//
//  EndViewController.swift
//  How High Ya Homie
//
//  Created by Justin Matsnev on 6/23/15.
//  Copyright (c) 2015 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = duration
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate
        }
        self.layer.addAnimation(rotateAnimation, forKey: nil)
    }
}

class EndViewController : UIViewController  {
    
    @IBOutlet var image : UIImageView!
    @IBOutlet var typeImage : UIImageView!
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
   // let loginView : FBSDKLoginManager = FBSDKLoginManager()
    @IBOutlet var fbButton : UIButton!
    @IBOutlet var twitterButton : UIButton!
    @IBOutlet var saveButton : UIButton!
    @IBOutlet var restartButton : UIButton!
    @IBOutlet var wholeImage : UIImageView!

    override func viewDidAppear(animated: Bool) {
        let num: AnyObject? = defaults.objectForKey("finalNum")?.floatValue
        let numm : Float = num as! Float
        println(num)
        if numm >= 0.01 && numm <= 1.9 {
            typeImage.image = UIImage(named: ("sober.png"))
            self.typeImage.rotate360Degrees(duration: 1.0, completionDelegate: self)
        }
        if numm >= 2.0 && numm <= 2.9 {
            typeImage.image = UIImage(named: ("buzzed.png"))
            self.typeImage.rotate360Degrees(duration: 1.0, completionDelegate: self)

        }
        if numm >= 3.0 && numm <= 3.9 {
            typeImage.image = UIImage(named: ("high.png"))
            self.typeImage.rotate360Degrees(duration: 1.0, completionDelegate: self)

        }
        if numm >= 4.0 && numm <= 4.9 {
            typeImage.image = UIImage(named: ("stoned.png"))
            self.typeImage.rotate360Degrees(duration: 1.0, completionDelegate: self)

        }
        if numm >= 5.0 && numm <= 5.9 {
            typeImage.image = UIImage(named: ("toasted.png"))
            self.typeImage.rotate360Degrees(duration: 1.0, completionDelegate: self)

        }
        if numm >= 6.0 && numm <= 6.9 {
            typeImage.image = UIImage(named: ("baked.png"))
            self.typeImage.rotate360Degrees(duration: 1.0, completionDelegate: self)

        }
        if numm >= 7.0 && numm <= 7.9 {
            typeImage.image = UIImage(named: ("blazed.png"))
            self.typeImage.rotate360Degrees(duration: 1.0, completionDelegate: self)

        }
        if numm >= 8.0 && numm <= 8.9 {
            typeImage.image = UIImage(named: ("gone.png"))
            self.typeImage.rotate360Degrees(duration: 1.0, completionDelegate: self)

        }
        if numm >= 9.0 && numm <= 9.9 {
            typeImage.image = UIImage(named: ("fucked.png"))
            self.typeImage.rotate360Degrees(duration: 1.0, completionDelegate: self)

        }
        if numm >= 10.0 && numm <= 10.9 {
            typeImage.image = UIImage(named: ("otw.png"))
            self.typeImage.rotate360Degrees(duration: 1.0, completionDelegate: self)

        }
        if defaults.dataForKey("image") != nil {
            let imageData = defaults.objectForKey("image") as! NSData
            var image1 = UIImage(data: imageData)
            image.image = image1
            image.layer.cornerRadius = 3.0
            image.layer.borderColor = UIColor.darkGrayColor().CGColor
            image.layer.borderWidth = 2.0
        }

    }
    
//    @IBAction func facebookShare(sender : AnyObject) {
//        if (FBSDKAccessToken.currentAccessToken() != nil)
//        {
//            // User is already logged in, do work such as go to next view controller.
//        }
//        else
//        {
//            var fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
//            fbLoginManager .logInWithReadPermissions(["email"], handler: { (result, error) -> Void in
//                if (error == nil){
//                    var fbloginresult : FBSDKLoginManagerLoginResult = result
//                    if(fbloginresult.grantedPermissions.contains("email"))
//                    {
//                        self.getFBUserData()
//                        fbLoginManager.logOut()
//                    }
//                }
//            })
//
//        }
//    }
//    func getFBUserData(){
//        if((FBSDKAccessToken.currentAccessToken()) != nil){
//            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, publish_actions , picture.type(large), email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
//                if (error == nil){
//                    println(result)
//                }
//            })
//        }
//    }
//
//    
//  
//    @IBAction func twitterShare(sender : AnyObject) {
//        
//    }
    @IBAction func restart(sender : AnyObject) {
            let goBackView = self.storyboard!.instantiateViewControllerWithIdentifier("StartScreenViewController") as! StartScreenViewController

        self.presentViewController(goBackView, animated: true, completion: nil)
    }
    @IBAction func savePhoto(sender : AnyObject) {
        
        let a : NSTimeInterval = 1.0
        UIGraphicsBeginImageContext(wholeImage.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext())
        let image1 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image1, nil, nil, nil)
//        UIView.animateWithDuration(a, animations: {
//            self.wholeImage.hidden = false
//        })

    }
    override func viewDidLoad() {
        super.viewDidLoad()
            wholeImage.hidden = true
            }
}