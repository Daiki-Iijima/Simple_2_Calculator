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
        
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.init(
            red:0.9, green: 0.9, blue: 0.9, alpha: 1)
        label.frame = CGRect(x:50, y:200, width:320, height:80)
        
        label.textAlignment = NSTextAlignment.right
        label.font = UIFont.systemFont(ofSize: 40.0)
        
        self.view.addSubview(label)
        
        // スクリーンの横縦幅
        let screenWidth:CGFloat = self.view.frame.width
        let screenHeight:CGFloat = self.view.frame.height
        
        var count = 0
        let stArray =
            [
                "C","@","%","÷",
                "1","2","3","×",
                "4","5","6","-",
                "7","8","9","+",
                "0","00",".","=",
        ]
        
        for i in 0 ..< 5
        {
            for j in 0 ..< 4
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
    
    var valueStr = ""
    var firstValue = ""
    var secondValue = ""
    var flag=false
    
    @objc func buttonTapped(sender : AnyObject) {
        
        if(sender.accessibilityValue == "C")
        {
            valueStr = ""
            label.text = ""
            
            firstValue = ""
            secondValue = ""
            
            return
        }
        
        if(!flag)
        {
            if(sender.accessibilityValue == "%" ||
                sender.accessibilityValue == "÷" ||
                sender.accessibilityValue == "×" ||
                sender.accessibilityValue == "-" ||
                sender.accessibilityValue == "+")
            {
                valueStr = ""
                label.text = ""
                flag = true
                return
            }
        }
        
        if(sender.accessibilityValue == "=")
        {
            valueStr = String(Int(firstValue)! + Int(secondValue)!)
            label.text = valueStr
            return
        }
        
        if(!flag){ firstValue += sender.accessibilityValue!! }
        else{ secondValue += sender.accessibilityValue!! }
        
        valueStr += sender.accessibilityValue!!
        label.text = valueStr
        print(sender.accessibilityValue!!)
    }
    
    func CreateButton(_x:Int,_y:Int,_str:String) -> UIButton
    {
        let btn1 = UIButton()
        
        // ボタンの位置とサイズを設定
        btn1.frame = CGRect(x:30 + (_x*90), y:400 + (_y*90),
                            width:80, height:80)
        
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

