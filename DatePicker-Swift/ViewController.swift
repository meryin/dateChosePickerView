//
//  ViewController.swift
//  DatePicker-Swift
//
//  Created by 尹彩霞 on 16/1/12.
//  Copyright © 2016年 尹彩霞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timeLabel:UILabel?
    var picker:DatePickerView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let btn:UIButton = UIButton(type: UIButtonType.Custom)
        btn.frame = CGRectMake(20, 100, 100, 100);
        btn.setTitle("选择日期", forState: UIControlState.Normal)
        btn.addTarget(self, action: Selector("click:"), forControlEvents: UIControlEvents.TouchUpInside)
        btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        self.view.addSubview(btn)
        timeLabel = UILabel(frame: CGRectMake(20, 150, 300, 100))
        self.view.addSubview(timeLabel!)
        timeLabel?.textColor = UIColor.blackColor()
    }

    func click(sender: UIButton)
    {
        picker = DatePickerView.getShareInstance()
        picker!.textColor = UIColor.redColor()
        picker!.showWithDate(NSDate())
        picker?.block = {
            (date:NSDate)->() in
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy年-MM月-dd日 zzz"
            let string = formatter.stringFromDate(date)
            let range:Range = string.rangeOfString(" ")!
            let time = string.substringToIndex(range.endIndex)
            self.timeLabel?.text = time
        }
    }


}

