//
//  AccountInfoModel.swift
//  iWallet
//
//  Created by cmouse on 2018/5/28.
//  Copyright © 2018年 snailgames. All rights reserved.
//

import UIKit

class AccountInfoModel: NSObject,NSCoding{

    var account :String?
    var pwd:String?
    var title:String?
    
    init(account:String,pwd:String,title:String) {
        self.account = account
        self.pwd = pwd
        self.title = title
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(account, forKey: "account")
        aCoder.encode(pwd, forKey: "pwd")
        aCoder.encode(title, forKey: "title")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.account = aDecoder.decodeObject(forKey: "account") as? String
        self.pwd = aDecoder.decodeObject(forKey: "pwd") as? String
        self.title = aDecoder.decodeObject(forKey: "title") as? String
    }
    
}
