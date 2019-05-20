//
//  ViewController.swift
//  sixdemo
//
//  Created by jujiakeji on 2019/5/20.
//  Copyright © 2019年 Soul. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    var imageView : UIImageView!
    var scrollView : UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named: "samplePhoto.jpeg")
        imageView.isUserInteractionEnabled = true
        
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.maximumZoomScale = 4.0
        scrollView.minimumZoomScale = 1
        scrollView.backgroundColor = UIColor.black
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        self.view .addSubview(scrollView)
        scrollView .addSubview(imageView)
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

}

