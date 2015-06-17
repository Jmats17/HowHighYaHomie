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
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    override func viewDidAppear(animated: Bool) {
        arrow.layer.anchorPoint = CGPointMake(0.5, 1)
        let pointsArray : Array = [-80,-60,-40,-15,15,40,60,80]
        let randomIndex = Int(arc4random_uniform(UInt32(pointsArray.count)))
        UIView.animateWithDuration(5.0, animations: {
            // animating `transform` allows us to change 2D geometry of the object
            // like `scale`, `rotation` or `translate`
     
            self.arrow.transform = CGAffineTransformMakeRotation(CGFloat(self.DegreesToRadians(Double(CGFloat(pointsArray[randomIndex])))))
            
        })
        
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

    func DegreesToRadians (value:Double) -> Double {
        return value * M_PI / 180.0
    }
    
    
    
    
    

}

