//
//  logViewController.swift
//  demo
//
//  Created by jujiakeji on 2019/5/13.
//  Copyright © 2019年 Soul. All rights reserved.
//

import UIKit

class logViewController:UIViewController,UITableViewDelegate,UITableViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        self.title = "uI控件"
        // Do any additional setup after loading the view.
        let viewww = UIView.init()
        viewww.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        viewww.backgroundColor = UIColor .white
        self.view .addSubview(viewww)
        
        
        let uilabel = UILabel.init()
        uilabel.frame = CGRect(x: 0, y: 20, width: self.view.bounds.width, height: 30)
        uilabel.text = "uilabel"
        uilabel.font = UIFont .systemFont(ofSize: 13)
        uilabel.textColor = UIColor .blue
        uilabel.textAlignment = NSTextAlignment.center //画居中显示
        
        
        uilabel.adjustsFontSizeToFitWidth = true//阴影
        uilabel.numberOfLines = 1//多行
        uilabel.shadowColor = UIColor .yellow//阴影颜色
        uilabel.shadowOffset = CGSize(width: 10, height: 10)//阴影便宜点
        uilabel.clipsToBounds = true
        uilabel.layer.cornerRadius = 10
        uilabel.layer.masksToBounds = true
        
        uilabel.layer.cornerRadius=10
        uilabel.backgroundColor=UIColor.cyan
        // 23、设置背景色圆角
        uilabel.clipsToBounds=true
        viewww .addSubview(uilabel)
        
        
        let button = UIButton.init()
        button.frame = CGRect(x: 0, y: 60, width: self.view.bounds.width, height: 50)
        button .setTitle("你好", for: .normal) //普通状态下的文字
        button.setTitle("触摸状态", for:.highlighted) //触摸状态下的文字
        button.setTitle("禁用状态", for:.disabled) //禁用状态下的文字
       
        button.setTitleColor(UIColor.black,for: .normal) //普通状态下文字的颜色
        button.setTitleColor(UIColor.green,for: .highlighted) //触摸状态下文字的颜色
        button.setTitleColor(UIColor.gray,for: .disabled) //禁用状态下文字的颜色
        
        button.setTitleShadowColor(UIColor.green,for:.normal) //普通状态下文字阴影的颜色
        button.setTitleShadowColor(UIColor.yellow,for:.highlighted) //普通状态下文字阴影的颜色
        button.setTitleShadowColor(UIColor.gray,for:.disabled) //普通状态下文字阴影的颜色
        button.backgroundColor=UIColor.yellow
        
        button.setImage(UIImage(named:"店铺街拷贝"),for:.normal)  //设置图标 
        button.adjustsImageWhenHighlighted=false //使触摸模式下按钮也不会变暗
        button.adjustsImageWhenDisabled=false //使禁用模式下按钮也不会变暗
        button.setBackgroundImage(UIImage(named:"商家背景"),for:.normal)
        viewww .addSubview(button)
        
        button.addTarget(self,action:#selector(tapped(_button:)),for:.touchUpInside)
        //
        let url = URL(string: "http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E5%9B%BE%E7%89%87&step_word=&hs=0&pn=14&spn=0&di=79592949370&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=undefined&cs=222669847%2C2735905052&os=2563775024%2C2660355531&simid=3351857723%2C241818619&adpicid=0&lpn=0&ln=1535&fr=&fmq=1557969905774_R&fm=&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&oriquery=&objurl=http%3A%2F%2Fpic3.nipic.com%2F20090520%2F2489240_222607039_2.jpg&gsm=3c&rpstart=0&rpnum=0&islist=&querylist=&force=undefined")
        let data = try! Data(contentsOf: url!)
        let newImage = UIImage(data: data)
        
        //        imageView.image = newImage;
        
        //let imagename = "我背景"
        //let image = UIImage(named: newImage)
        let imageview = UIImageView.init()
        imageview.frame = CGRect(x: 20, y: 120, width: self.view.bounds.size.width-40, height: 120)
        imageview.image = newImage
        viewww .addSubview(imageview)
        
        
        imageview.isUserInteractionEnabled = true
        let target = UITapGestureRecognizer(target: self, action: #selector(tageClick))
        imageview.addGestureRecognizer(target)
        
        
        // let tableView = UITableView(frame: view.bounds, style: .grouped)
         let tableview = UITableView.init(frame: CGRect(x: 0, y: 250, width: self.view.bounds.size.width, height: self.view.bounds.size.height-250), style: .grouped)
        tableview.delegate = self
        tableview.dataSource = self
        viewww .addSubview(tableview)
        
        
        let heaview = UIView.init()
        heaview.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 30)
        heaview.backgroundColor = UIColor .green
        tableview.tableHeaderView = heaview
        
        
        let footview = UIView.init()
        footview.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 20)
        footview.backgroundColor = UIColor .red
        tableview.tableFooterView = footview
        
        
        
        
    }
    //按钮点击事件
    @objc func tapped(_button:UIButton){
        print(1111)
    }
    
    @objc func tageClick()  {
        print("触发手势")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        //cell个数
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell==nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        cell!.selectionStyle = UITableViewCell.SelectionStyle.none
        cell!.textLabel?.text = "这个是标题~"
        cell!.detailTextLabel?.text = "这里是内容了油~"
        cell!.imageView?.image = UIImage(named:"Expense_success")
        return cell!
    }
    // 设置cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    // 选中cell后执行此方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
