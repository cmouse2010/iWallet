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

    func initLabs(data : (title:String,account:String,pwd:String)) -> Void {
        titleLab?.text = data.title
        accountLab?.text = data.account
        pwdLab?.text = data.pwd
    }

}
