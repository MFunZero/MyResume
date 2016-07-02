//
//  ProgressView.swift
//  MyResume
//
//  Created by fanzz on 16/6/16.
//  Copyright © 2016年 fanzz. All rights reserved.
//

import UIKit

public class ProgressView: UIView {
    
    var textLabel:UICountLabel!
    var lineWidth:CGFloat?
    
    var toValue:Double?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup()
    {
        if toValue == nil {
            toValue = 1.0
        }
        
        let rect = CGRectMake(0, 0, self.frame.width, self.frame.height)
        let center = CGPoint(x: rect.width/2,y: rect.height/2)
        
        let beizPath = UIBezierPath(arcCenter: center, radius: CGFloat(CGRectGetWidth(rect)/2), startAngle: CGFloat(0.0), endAngle: CGFloat(M_PI*2*toValue!), clockwise: true)
        //先画一个圆
        let layer = CAShapeLayer()
        layer.path=beizPath.CGPath
        layer.fillColor=UIColor.clearColor().CGColor//填充色
        layer.strokeColor=UIColor.whiteColor().CGColor//边框颜色
        layer.lineWidth = lineWidth != nil ? lineWidth!:2
        layer.lineCap=kCALineCapRound   //线框类型
        self.layer.addSublayer(layer)
        
        let animation=CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue=0.0
        animation.toValue=1
        animation.duration=6.0
        animation.fillMode=kCAFillModeBoth
        animation.timingFunction=CAMediaTimingFunction (name: kCAMediaTimingFunctionLinear)
        layer.addAnimation(animation, forKey: "animation")
        
        textLabel = UICountLabel(frame: CGRectMake( rect.width / 2 - 40, rect.height / 2 - 16, 80.0, 32.0))
        textLabel.center = CGPoint(x: rect.width/2, y: rect.height/2)
        textLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 32)
        textLabel.textAlignment = .Center
        textLabel.textColor = UIColor.whiteColor()
        textLabel.countFrom(0, to: Int(toValue! * 100), withDuration: 6)
        self.addSubview(textLabel)
        
    }
    
}
