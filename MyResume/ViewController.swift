//
//  ViewController.swift
//  MyResume
//
//  Created by fanzz on 16/6/16.
//  Copyright © 2016年 fanzz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bgImageView: UIImageView!
    var valuesOfSkills:[Double] = [0.75,0.7,0.5]
    var subject: [String] = ["iOS开发","java开发","前端开发"]
    var content:[String] = ["熟悉Swift和Objective-C语言开发，熟悉网络请求，了解json解析、sqlite等","了解ssh、Spring-MVC、以及MySQL数据库","了解js、css3、html等"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.modalTransitionStyle = .FlipHorizontal
        let bgView = EmitterView(frame: self.view.frame, emitterMode: kCAEmitterLayerLine)
        self.bgImageView.addSubview(bgView)
        

        
        UIView.animateWithDuration(0.1, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: {

            self.drawTopView()
            bgView.animation()

        }) { (flag) in

            for i in 0..<3 {
                let circleView = ProgressView(frame:CGRectMake(45, 200 + CGFloat((100 + 60)*i), 100, 100))
                circleView.toValue = self.valuesOfSkills[i]
                circleView.lineWidth = 3
                circleView.setup()
                self.bgImageView.addSubview(circleView)
                self.startLineToPoint(circleView.frame.origin.x + circleView.frame.width + 10, y: circleView.frame.origin.y + circleView.frame.height/2, width: 50,text: self.subject[i],content:self.content[i] )
            }

        }
    }
    
    func drawTopView()
    {
        let finalSize = CGSizeMake(CGRectGetWidth(view.frame), 150)
        let layerHeight = finalSize.height * 0.4
        let layer = CAShapeLayer()
        let bezier = UIBezierPath()
        bezier.moveToPoint(CGPointMake(0, finalSize.height - layerHeight))
        bezier.addLineToPoint(CGPointMake(0, 0))
        bezier.addLineToPoint(CGPointMake(finalSize.width, 0))
        bezier.addLineToPoint(CGPointMake(finalSize.width, finalSize.height - layerHeight))
        bezier.addQuadCurveToPoint(CGPointMake(0,finalSize.height - layerHeight),controlPoint: CGPointMake(finalSize.width / 2, (finalSize.height - layerHeight) + 70))
        layer.path = bezier.CGPath
        layer.fillColor = UIColor(rgb: 0xAD6153).CGColor
        
        self.bgImageView.layer.addSublayer(layer)
        
        
        let authorLabel = UILabel(frame: CGRect(x: view.frame.width/2-50, y: 60, width: 100, height: 30))
        authorLabel.text = "Skills"
        authorLabel.textAlignment = .Center
        authorLabel.textColor = UIColor.whiteColor()
        authorLabel.alpha = 1.0
        authorLabel.font = UIFont.systemFontOfSize(32)
        self.bgImageView.addSubview(authorLabel)

        
    }
    
    func startLineToPoint(x:CGFloat,y:CGFloat,width:CGFloat,text:String,content:String)
    {
       
        let dX = x + width
        
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
        pathAnimation.duration = 2.0;
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        pathLayer.addAnimation(pathAnimation, forKey: "strokeEnd")
        
        
        let authorLabel = UILabel(frame: CGRect(x: dX+10, y: y - 15, width: 100, height: 30))
        authorLabel.text = text
        authorLabel.textAlignment = .Left
        authorLabel.textColor = UIColor.whiteColor()
        authorLabel.alpha = 0.0
        authorLabel.font = UIFont.systemFontOfSize(18)
        self.bgImageView.addSubview(authorLabel)
        
        let descriptionLabel = UILabel(frame: CGRect(x: x, y: y + 15, width: 200, height: 20))
        descriptionLabel.textAlignment = .Left
        descriptionLabel.textColor = UIColor.whiteColor()
        descriptionLabel.alpha = 0.0
        self.bgImageView.addSubview(descriptionLabel)
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = NSLineBreakMode.ByCharWrapping  //自动折行
        descriptionLabel.font = UIFont.systemFontOfSize(14)
        //根据detailText文字长度调节topView高度
        let constraint = CGSize(width: descriptionLabel.frame.size.width,height: 200.0)
        
        let size = (content as NSString).boundingRectWithSize(constraint, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: NSDictionary(object:UIFont.systemFontOfSize(14), forKey: NSFontAttributeName) as? [String : AnyObject] ,context: nil)
        
        descriptionLabel.frame = CGRectMake(descriptionLabel.frame.origin.x, descriptionLabel.frame.origin.y,size.width, size.height);//保持原来Label的位置和宽度，只是改变高度。
        descriptionLabel.text = content

        UIView.animateWithDuration(1.0, delay: 0.5, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            authorLabel.alpha = 1.0
            descriptionLabel.alpha = 1.0
            }, completion: {Void in
//                self.performSelector(#selector(ViewController.nextPage), withObject: nil)
        })
        
    }
    
    func nextPage()
    {
        let vc:CollectionViewController = UIStoryboard(name: "CollectionViewController", bundle: nil).instantiateViewControllerWithIdentifier("CollectionViewController") as! CollectionViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }


    func drawContentImage()
    {
        let rect = CGRectMake(100, 100, 100, 100)
        let beizPath = UIBezierPath(roundedRect: rect, cornerRadius: 50.0)
        //先画一个圆
        let layer = CAShapeLayer()
        layer.path=beizPath.CGPath
        layer.fillColor=UIColor.clearColor().CGColor//填充色
        layer.strokeColor=UIColor.whiteColor().CGColor//边框颜色
        layer.lineWidth=2.0
        layer.lineCap=kCALineCapRound   //线框类型
        self.view.layer.addSublayer(layer)
        
        
        let animation=CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue=0.0
        animation.toValue=1.0
        animation.duration=6.0
        animation.fillMode=kCAFillModeForwards
        animation.timingFunction=CAMediaTimingFunction (name: kCAMediaTimingFunctionLinear)
        layer.addAnimation(animation, forKey: "animation")
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
