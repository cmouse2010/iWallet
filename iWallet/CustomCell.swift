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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //划动手势
    @objc func handleSwipeGesture(sender: UISwipeGestureRecognizer){
        //划动的方向
        let direction = sender.direction
        //判断是上下左右
        switch (direction){
        case UISwipeGestureRecognizerDirection.left:
            print("Left")
            break
        case UISwipeGestureRecognizerDirection.right:
            print("Right")
            break
        case UISwipeGestureRecognizerDirection.up:
            print("Up")
            break
        case UISwipeGestureRecognizerDirection.down:
            print("Down")
            break
        default:
            break;
        }
    }

    func initLabs(data : (title:String,account:String,pwd:String)) -> Void {
        titleLab?.text = data.title
        accountLab?.text = data.account
        pwdLab?.text = data.pwd
        
        self.contentView.isUserInteractionEnabled = false
        
        //添加手势
        //划动手势 左划
        
        let action:Selector = #selector(CustomCell.handleSwipeGesture(sender:))
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: action)
        swipeLeftGesture.direction = UISwipeGestureRecognizerDirection.left
        self.contentView.addGestureRecognizer(swipeLeftGesture)
    }
    

    
    func initLabs(accountModel:AccountInfoModel) -> Void {
        self.titleLab.text = accountModel.title
        self.accountLab.text = accountModel.account
        self.pwdLab.text = accountModel.pwd
    }

}
