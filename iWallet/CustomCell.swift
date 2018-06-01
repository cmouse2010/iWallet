//
//  CustomCell.swift
//  iWallet
//
//  Created by cmouse on 2018/5/17.
//  Copyright © 2018年 snailgames. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var accountLab: UILabel!
    @IBOutlet weak var pwdLab: UILabel!
    @IBOutlet weak var delBtn: UIButton!
    @IBOutlet weak var changeBtn: UIButton!

    var dataIndex = 0
    
    @IBAction func clickChangeBtn(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: Constant.NOTIFICATION_FIRSTVIEWCONTR_DATA_CHANGE), object: self.dataIndex)
    }
    
    
    @IBAction func clickDelBtn(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: Constant.NOTIFICATION_FIRSTVIEWCONTR_DATA_DEL), object: self.dataIndex)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


    func initLabs(data : (title:String,account:String,pwd:String)) -> Void {
        titleLab?.text = data.title
        accountLab?.text = data.account
        pwdLab?.text = data.pwd
    }
    
    //划动手势
    @objc func handleSwipeGesture(sender: UISwipeGestureRecognizer){
        //划动的方向
        let direction = sender.direction
        //判断是上下左右
        switch (direction){
        case UISwipeGestureRecognizerDirection.left:
            NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: Constant.NOTIFICATION_FIRSTVIEWCONTR_LEFT_SWIPE), object: self.dataIndex)
            break
        case UISwipeGestureRecognizerDirection.right:
            NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: Constant.NOTIFICATION_FIRSTVIEWCONTR_RIGHT_SWIPE), object: self.dataIndex)
            break
        case UISwipeGestureRecognizerDirection.up:

            break
        case UISwipeGestureRecognizerDirection.down:

            break
        default:
            break;
        }
    }
    
    func initLabs(accountModel:AccountInfoModel,dataindex:Int) -> Void {
        self.titleLab.text = accountModel.title
        self.accountLab.text = accountModel.account
        self.pwdLab.text = accountModel.pwd
        self.dataIndex = dataindex
        
        guard let show = accountModel.isshow else {
           return
        }
        
        showBtn(isshow: show)
        
        //添加手势
        //划动手势 左划
        
        let action:Selector = #selector(CustomCell.handleSwipeGesture(sender:))
        let swipeLeftGestureL = UISwipeGestureRecognizer(target: self, action: action)
        swipeLeftGestureL.direction = UISwipeGestureRecognizerDirection.left
        self.contentView.addGestureRecognizer(swipeLeftGestureL)
        
        let swipeLeftGestureR = UISwipeGestureRecognizer(target: self, action: action)
        swipeLeftGestureR.direction = UISwipeGestureRecognizerDirection.right
        self.contentView.addGestureRecognizer(swipeLeftGestureR)
        
    }
    
    func showBtn(isshow:Bool) {
        if isshow {
            self.delBtn.isHidden = false
            self.changeBtn.isHidden = false
        } else {
            self.delBtn.isHidden = true
            self.changeBtn.isHidden = true
        }
    }

}
