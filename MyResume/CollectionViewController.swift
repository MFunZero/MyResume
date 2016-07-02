//
//  CollectionViewController.swift
//  MyResume
//
//  Created by fanzz on 16/6/17.
//  Copyright © 2016年 fanzz. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollectionCell"

class CollectionViewController: UICollectionViewController {

    var imagesName:[String] = ["k","m","c","l","e","f","k","h","i","j",]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   }

extension CollectionViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
//        cell.backgroundColor = UIColor(red: CGFloat(arc4random() % 255) / 255.0, green: CGFloat(arc4random() % 255) / 255.0, blue: CGFloat(arc4random() % 255) / 255.0, alpha: 1.0)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
        cell.addSubview(imageView)
        
        imageView.image = UIImage(named: self.imagesName[indexPath.row])
        cell.layer.allowsEdgeAntialiasing = true
        return cell
    }
}
