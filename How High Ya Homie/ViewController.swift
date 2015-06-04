//
//  ViewController.swift
//  How High Ya Homie
//
//  Created by Justin Matsnev on 5/20/15.
//  Copyright (c) 2015 Justin Matsnev. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
 
    
    @IBOutlet var arrow: UIImageView!
    let anchorPointt : CGPoint = CGPointMake(0.5, 0.5)
    override func viewDidLoad() {
        super.viewDidLoad()
        arrow.layer.anchorPoint = CGPointMake(0.5, 1)

        self.arrow.transform = CGAffineTransformMakeRotation(180)
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if defaults.dataForKey("image") != nil {
            let imageData = defaults.objectForKey("image") as! NSData
            var image1 = UIImage(data: imageData)
            image.image = image1
            image.layer.cornerRadius = 1.0
            image.layer.borderColor = UIColor.blackColor().CGColor
            image.layer.borderWidth = 4.0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    
    
    

}

