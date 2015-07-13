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
    @IBOutlet var eyeLabel : UILabel!
    @IBOutlet var lookLabel : UILabel!
    @IBOutlet var startProcessButton : UIButton!
    @IBOutlet var progressLabel : UILabel!
    @IBOutlet var scanningLabel : UILabel!
    @IBOutlet var progressView : UIProgressView!
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

 //   @IBOutlet var arrow: UIImageView!
    var counter:Int = 0 {
        didSet {
            let fractionalProgress = Float(counter) / 200.0
            let animated = counter != 0
            
            progressView.setProgress(fractionalProgress, animated: animated)
            progressLabel.text = ("\(counter)%")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    override func viewDidAppear(animated: Bool) {
   //     arrow.layer.anchorPoint = CGPointMake(0.5, 1)
        let pointsArray : Array = [-80,-60,-40,-15,15,40,60,80]
        let randomIndex = Int(arc4random_uniform(UInt32(pointsArray.count)))
        UIView.animateWithDuration(5.0, animations: {
            // animating `transform` allows us to change 2D geometry of the object
            // like `scale`, `rotation` or `translate`
     
        //    self.arrow.transform = CGAffineTransformMakeRotation(CGFloat(self.DegreesToRadians(Double(CGFloat(pointsArray[randomIndex])))))
            
        })
        
        if defaults.dataForKey("image") != nil {
            let imageData = defaults.objectForKey("image") as! NSData
            var image1 = UIImage(data: imageData)
            image.image = image1
            image.layer.cornerRadius = 1.0
            image.layer.borderColor = UIColor.blackColor().CGColor
            image.layer.borderWidth = 4.0
        }
    }
    
    @IBAction func startProcessButton(sender : AnyObject)
    {
        let startVal = 0
        let timer = 1.0
        let numArray : Array = [0,1,2,3,4,5,6,7,8,9,10]
        let randNum = Int(arc4random_uniform(UInt32(numArray.count)))
        let randNumLook = Int(arc4random_uniform(UInt32(numArray.count)))
        let finalNum = (Float(randNumLook + randNum) / 2.0)
        self.startProcessButton.enabled = false
        defaults.setFloat(finalNum, forKey: "finalNum")
        println(finalNum)
        defaults.synchronize()
//        let delay = timer * Double(NSEC_PER_SEC)  // nanoseconds per seconds
//        var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))


//        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
//            
//            //self.lookLabel.text = "\(randNumLook)"
//           
//            
//        })
        let endView = self.storyboard!.instantiateViewControllerWithIdentifier("EndViewController") as! EndViewController
        self.counter = 0
        for i in 0..<200 {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
                sleep(1)
                dispatch_async(dispatch_get_main_queue(), {
                    self.counter++
                    if self.counter == 25 {
                        self.scanningLabel.text = "Scanning Dem Eyes..."
                    }
                    if self.counter == 35 {
                        self.scanningLabel.text = "Ahh.."
                    }
                    
                    if self.counter == 50 {
                        self.eyeLabel.text = "\(randNum)"
                      //  self.counter++
                        self.scanningLabel.text = "Calculating Looks..."

                    }
                    if self.counter == 75 {
                        
                        self.scanningLabel.text = "Ooo.."
                    }
                    if self.counter == 100 {
                        self.lookLabel.text = "\(randNumLook)"
                       // self.counter++
                        self.scanningLabel.text = "Analyzing Overall.."
                    }
                    if self.counter == 150 {
                        self.scanningLabel.text = "Interesting.."
                    }
                    if self.counter == 200 {
                        self.presentViewController(endView, animated: true, completion: nil)
                       // self.counter++
                        self.scanningLabel.text = "Done."
                    }
                    return
                })
            })
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

