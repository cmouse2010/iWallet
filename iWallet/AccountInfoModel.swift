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
    var isshow:Bool?
    
    
    init(account:String,pwd:String,title:String,isshow:Bool = false) {
        self.account = account
        self.pwd = pwd
        self.title = title
        self.isshow = isshow
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(account, forKey: "account")
        aCoder.encode(pwd, forKey: "pwd")
        aCoder.encode(title, forKey: "title")
        aCoder.encode(isshow, forKey: "isshow")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.account = aDecoder.decodeObject(forKey: "account") as? String
        self.pwd = aDecoder.decodeObject(forKey: "pwd") as? String
        self.title = aDecoder.decodeObject(forKey: "title") as? String
        self.isshow = aDecoder.decodeObject(forKey: "isshow") as? Bool
    }
    
}
