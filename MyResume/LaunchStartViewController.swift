//
//  LaunchScreenViewController.swift
//  MyResume
//
//  Created by fanzz on 16/6/16.
//  Copyright © 2016年 fanzz. All rights reserved.
//

import UIKit

class LaunchStartViewController: UIViewController {
    @IBOutlet weak var subjectLabel: UILabel!

    @IBOutlet weak var bgImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let bgView = EmitterView(frame: self.view.frame)
        self.bgImageView.addSubview(bgView)
        
        //animations
        simpleAnimationBegin()
        
        bgView.animation()
        
        
        
    }
    
    //切换视图并播放动画
    func play(){
        UIView.beginAnimations("animation", context: nil)
        UIView.setAnimationDuration(2)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationTransition(.FlipFromLeft, forView: self.bgImageView, cache: false)
        UIView.commitAnimations()
        
    }
    

    func simpleAnimationBegin()
    {
        subjectLabel.alpha = 0.0

        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: UIViewAnimationOptions.AllowAnimatedContent, animations: {
            
        }) { (finished: Bool) in
            
        }
        UIView.animateWithDuration(1.0, delay: 0.5, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.subjectLabel.text = "iOS开发"
            self.subjectLabel.alpha = 1.0

            }, completion: {Void in
                self.startLineToPoint()
                
        })
        
        UIView.animateWithDuration(2,
                                   animations:
            { self.subjectLabel.layer.position.y -= 30 },
                                   completion: {(finished) in UIView.animateWithDuration(2, delay: 0,
                                    usingSpringWithDamping: 0.2,
                                    initialSpringVelocity: 5.0,
                                    options: UIViewAnimationOptions.CurveEaseOut,
                                    animations: {//弹性参数的调教，可以参见本文的“参考”部分 
                                        self.subjectLabel.layer.position.y += 30 },
                                    completion: nil)})
        
        
    }
    
    
    func startLineToPoint()
    {
        let x = subjectLabel.frame.origin.x + 25
        let y = subjectLabel.frame.origin.y + subjectLabel.frame.height + 5
        let dX = x + subjectLabel.bounds.width - 50
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: x, y: y))
        path.addLineToPoint(CGPoint(x: dX, y: y))
            
        let pathLayer = CAShapeLayer()
        pathLayer.frame = self.view.bounds
        pathLayer.path = path.CGPath
        pathLayer.strokeColor = UIColor.whiteColor().CGColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 1.0
        pathLayer.lineJoin = kCALineJoinBevel
        
        self.bgImageView.layer.addSublayer(pathLayer)
        
        
        
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 1.0;
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        pathLayer.addAnimation(pathAnimation, forKey: "strokeEnd")
        
        
        let authorLabel = UILabel(frame: CGRect(x: self.view.bounds.width/2 - 50, y: y + 10, width: 100, height: 20))
        authorLabel.text = "Allen"
        authorLabel.textAlignment = .Center
        authorLabel.textColor = UIColor.whiteColor()
        authorLabel.alpha = 0.0
        self.bgImageView.addSubview(authorLabel)
        
        UIView.animateWithDuration(1.0, delay: 0.5, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            authorLabel.alpha = 1.0
            }, completion: {Void in
                self.performSelector(#selector(LaunchStartViewController.nextPage), withObject: nil)
        })
        
    }
    
    func nextPage()
    {
        let vc:ViewController = UIStoryboard(name: "ViewController", bundle: nil).instantiateInitialViewController() as! ViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
