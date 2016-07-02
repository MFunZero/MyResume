//
//  EmitterView.swift
//  MyResume
//
//  Created by fanzz on 16/6/16.
//  Copyright © 2016年 fanzz. All rights reserved.
//

import UIKit

class EmitterView: UIView {

    var chargeLayer:CAEmitterLayer
    var explosionLayer:CAEmitterLayer

    
    required init?(coder aDecoder: NSCoder) {
        explosionLayer = CAEmitterLayer()
        chargeLayer    = CAEmitterLayer()
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        explosionLayer = CAEmitterLayer()
        chargeLayer    = CAEmitterLayer()
        super.init(frame: frame)
        setup()
    }
    
    init(frame:CGRect,emitterMode:String)
    {
        explosionLayer = CAEmitterLayer()
        chargeLayer    = CAEmitterLayer()
        super.init(frame: frame)
        setup(emitterMode)
    }
    
    func setup(emitterMode:String)
    {
        let explosionCell           = CAEmitterCell()
        explosionCell.name          = "explosion"
        explosionCell.lifetime      = 50.0
        explosionCell.birthRate     = 10
        explosionCell.velocity      = 10.00
        explosionCell.velocityRange = 5
        explosionCell.scale         = 0.05
        explosionCell.scaleRange    = 3
        explosionCell.contents      = UIImage(named: "anoww")?.CGImage
        explosionCell.yAcceleration = 2
        explosionCell.emissionRange = 0.0

        
        let explosionCell1           = CAEmitterCell()
        explosionCell1.name          = "explosion1"
        explosionCell1.lifetime      = 50.0
        explosionCell1.birthRate     = 10
        explosionCell1.velocity      = 10.00
        explosionCell1.velocityRange = 5
        explosionCell1.scale         = 0.05
        explosionCell1.scaleRange    = 3
        explosionCell1.contents      = UIImage(named: "snow")?.CGImage
        explosionCell1.yAcceleration = 2

        
        explosionLayer.name          = "emitterLayer"
        explosionLayer.emitterShape  = kCAEmitterLayerCuboid;
        explosionLayer.emitterMode   = kCAEmitterLayerOutline;
        explosionLayer.emitterSize   = CGSizeMake(self.frame.size.width/2.0, 0);
        explosionLayer.emitterCells  = [explosionCell,explosionCell1]
        explosionLayer.renderMode    = kCAEmitterLayerOldestFirst;
        explosionLayer.birthRate     = 0.0
        explosionLayer.position      = CGPointMake(self.frame.size.width/2.0, -20);
        layer.addSublayer(explosionLayer)

        
    }
    
    func setup() {
        
        let explosionCell           = CAEmitterCell()
        explosionCell.name          = "explosion"
        explosionCell.alphaRange    = 0.10
        explosionCell.alphaSpeed    = -1.0
        explosionCell.lifetime      = 5.0
        explosionCell.lifetimeRange = 0.3
        explosionCell.birthRate     = 20000
        explosionCell.velocity      = 200.00
        explosionCell.velocityRange = 30.00
        explosionCell.scale         = 0.05
        explosionCell.scaleRange    = 0.05
        explosionCell.contents      = UIImage(named: "Sparkle")?.CGImage
        
        explosionLayer.name          = "emitterLayer"
        explosionLayer.emitterShape  = kCAEmitterLayerCircle;
        explosionLayer.emitterMode   = kCAEmitterLayerOutline;
        explosionLayer.emitterSize   = CGSizeMake(10, 0);
        explosionLayer.emitterCells  = [explosionCell]
        explosionLayer.renderMode    = kCAEmitterLayerOldestFirst;
        explosionLayer.birthRate     = 0.0
        explosionLayer.position      = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
        layer.addSublayer(explosionLayer)
        
        
    }
    
    /**
     *  开始动画
     */
    func animation() {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
            animation.values = [1.5 ,0.8, 1.0,1.2,1.0]
            animation.duration = 0.5;
            startAnimate()
        animation.calculationMode = kCAAnimationCubic;
        layer.addAnimation(animation, forKey: "transform.scale")
        
    }
    /**
     *  开始喷射
     */
    func startAnimate() {
        
        chargeLayer.birthRate = 1.0
        //进入下一个动作
        performSelector(#selector(EmitterView.explode), withObject: nil, afterDelay: 0.2)
    }
    
    /**
     *  大量喷射
     */
    func explode() {
        
        explosionLayer.beginTime = CACurrentMediaTime()
        //explosionLayer喷射系数为1
        explosionLayer.birthRate = 3.0
        //停止喷射
        performSelector(#selector(EmitterView.stop), withObject: nil, afterDelay: 0.1)
    }
    
    
    /**
     *  停止喷射
     */
    func stop() {
        
        explosionLayer.birthRate = 0
    }


}
