//
//  ViewController.swift
//  fourdemo
//
//  Created by jujiakeji on 2019/5/17.
//  Copyright © 2019年 Soul. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {

    var limitedTextView:UITextView!
    var allowInputNumberLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.initNavigationBar()
        self.initInputField()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(note:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
       // self .keyboardWillChangeFrame(note: Notification)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func initInputField(){
        let naviFrame = self.navigationController?.navigationBar.frame
        let stausBarFrame = UIApplication.shared.statusBarFrame
        let newImage = UIImage(named: "avatar.jpg")
        let avatarImgView = UIImageView(frame: CGRect(x: 0, y: 100, width: 70, height: 70))
        avatarImgView.image = newImage
        self.view .addSubview(avatarImgView)
        
        limitedTextView = UITextView(frame: CGRect(x: 80, y: avatarImgView.frame.height, width: self.view.frame.width-70-20, height: 300))
        limitedTextView.backgroundColor = UIColor .red
        self.view .addSubview(limitedTextView)
        
        limitedTextView.delegate = self
        limitedTextView.font = UIFont .systemFont(ofSize: 20)
        
        allowInputNumberLabel = UILabel(frame: CGRect(x: self.view.frame.width-50, y: self.view.frame.height-40, width: 50, height: 40))
        self.view.addSubview(allowInputNumberLabel)
        allowInputNumberLabel.text = "140"
        allowInputNumberLabel.textAlignment = .right
    }
    func initNavigationBar (){
        let leftItem = UIBarButtonItem(title: "close", style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftItem
        
        let rightItem = UIBarButtonItem(title: "Tweet", style: .plain, target: self, action: nil)
        rightItem.tintColor = UIColor.green
        navigationItem.rightBarButtonItem =  rightItem
    }
    func textViewDidChange(_ textView: UITextView)
    {
        let currentCharactorCount = (textView.text?.characters.count)!
        if currentCharactorCount >= 140 {
            limitedTextView.resignFirstResponder()
        }
        allowInputNumberLabel.text = "\(140 - currentCharactorCount)"
    }
    @objc func keyboardWillChangeFrame(note: Notification) {
        let duration = note.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        let endFrame = (note.userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let y = endFrame.origin.y
        
        //计算工具栏距离底部的间距
        let margin = UIScreen.main.bounds.height - y
        UIView.animate(withDuration: duration) {
            //            键盘弹出
            if margin > 0 {
                self.allowInputNumberLabel.frame.origin.y = self.allowInputNumberLabel.frame.origin.y - margin
            }
                //            键盘收起
            else {
                self.allowInputNumberLabel.frame.origin.y = self.view.frame.height - 40
            }
        }
    }
}

