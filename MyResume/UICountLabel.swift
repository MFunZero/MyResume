//
//  UICountLabel.swift
//  MyResume
//
//  Created by fanzz on 16/6/16.
//  Copyright © 2016年 fanzz. All rights reserved.
//

import UIKit

public class UICountLabel: UILabel {
   
    var format:NSString?
    var from:Int?
    var toValue:Int?
    var timer = NSTimer()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func countFrom(from:Int,to:Int,withDuration:NSTimeInterval)
    {
        self.from = from
        self.toValue = to
        let time = withDuration/Double(to-from)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: #selector(UICountLabel.numberTo), userInfo: nil, repeats: true)
    }

    func numberTo()
    {
        if self.format == nil{
            self.format = "%"
        }
        if self.toValue == self.from{
            timer.invalidate()
            
        }else{
        self.from! += 1
        self.text = "\(self.from!)\(self.format!)"
            print("\(self.from)\(self.format)")
        }
    }
    
}
