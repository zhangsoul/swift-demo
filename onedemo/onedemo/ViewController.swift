//
//  ViewController.swift
//  onedemo
//
//  Created by jujiakeji on 2019/5/16.
//  Copyright © 2019年 Soul. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let label = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "i am the king of the world"
        label.textAlignment = NSTextAlignment.center
        self.view .addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.centerX.equalTo(self.view)
        }
        label.font = UIFont.systemFont(ofSize: 30)
        
        let changeBtn = UIButton(type: .custom)
        changeBtn.setTitle("change font family", for: UIControlState.normal)
        changeBtn.addTarget(self, action: #selector(changfontfamily), for: UIControlEvents.touchUpInside)
        changeBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        self.view .addSubview(changeBtn)
        changeBtn.layer.borderColor = UIColor.blue.cgColor
        changeBtn.layer.borderWidth = 1
        changeBtn.layer.cornerRadius = 5
        changeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(500)
            make.centerX.equalTo(self.view)
            make.width.equalTo(200)
        }
        printAllSupportedFontNames()
        shenmedongxiUI()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func changfontfamily(){
        label.font = UIFont(name: "Savoye LET", size: 30)
    }
    
    func shenmedongxiUI(){
        let labbbbb = UILabel()
        labbbbb.text = "asdasdashlkg;lmsf;ds"
        labbbbb.textAlignment = NSTextAlignment.center
        self.view .addSubview(labbbbb)
        labbbbb.snp.makeConstraints { (make) in
            make.top.equalTo(300)
            make.centerX.equalTo(self.view)
        }
        
    }
    

    func printAllSupportedFontNames (){
        let faminlyNames = UIFont.familyNames
        for familyName in faminlyNames{
            print("+++ \(familyName)")
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames{
                print("-----\(fontName)")
            }
            
        }
        
    }
}

