//
//  ViewController.swift
//  Simple_2_Calculator
//
//  Created by 飯島大樹 on 2020/02/14.
//  Copyright © 2020 Daiki Iijima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.green
        label.frame = CGRect(x:150, y:200, width:160, height:30)
        self.view.addSubview(label)
        
        // スクリーンの横縦幅
        let screenWidth:CGFloat = self.view.frame.width
        let screenHeight:CGFloat = self.view.frame.height
        
        var count = 0
        let stArray =
            [
                "1","2","3",
                "4","5","6",
                "7","8","9",
                "0",".","C",
            ]
        
        for i in 0 ..< 4
        {
            for j in 0 ..< 3
            {
                let btn=CreateButton(
                    _x: j,
                    _y: i,
                    _str: stArray[count]
                )
                
                btn.accessibilityValue = stArray[count]
                
                btn.addTarget(self, action:
                    #selector(ViewController.buttonTapped(sender:))
                    , for: .touchUpInside)
                
                self.view.addSubview(btn)
                
                count += 1
            }
        }
    }
    
    @objc func buttonTapped(sender : AnyObject) {
        
        label.text = sender.accessibilityValue!!
        print(sender.accessibilityValue!!)
    }
    
    func CreateButton(_x:Int,_y:Int,_str:String) -> UIButton
    {
        let btn1 = UIButton()
        
        // ボタンの位置とサイズを設定
        btn1.frame = CGRect(x:50 + (_x*110), y:400 + (_y*110),
                            width:100, height:100)
        
        // ボタンのタイトルを設定
        btn1.setTitle(_str, for:.normal)
        
        // タイトルの色
        btn1.setTitleColor(UIColor.white, for: .normal)
        
        // ボタンのフォントサイズ
        btn1.titleLabel?.font =  UIFont.systemFont(ofSize: 36)
        
        // 背景色
        btn1.backgroundColor = UIColor.init(
        red:0.9, green: 0.9, blue: 0.9, alpha: 1)
        
        return btn1
    }
}

