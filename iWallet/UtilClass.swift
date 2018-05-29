//
//  UtilClass.swift
//  iWallet
//
//  Created by cmouse on 2018/5/16.
//  Copyright © 2018年 snailgames. All rights reserved.
//

import Foundation

class UtilClass: NSObject {
    
//文件处理部分
    var filepath : NSString?
    
    static let manager = FileManager.default
    
    //获取document文件名
    static func createFilePah(filename:String?) -> String?{
        let urlForDocument = manager.urls(for: .documentDirectory, in:.userDomainMask)
        let url = urlForDocument[0]
        if filename != nil {
            let fpath = url.appendingPathComponent(filename!).absoluteString
            print("create file path :" + fpath)
            return fpath
        } else {
            return nil
        }
        
    }
    
    //文件是否存在
    static func fileisExist(filename:String?) -> Bool {
        if filename != nil {
            let filePath = createFilePah(filename: filename!)
            return manager.fileExists(atPath: filePath!)
        } else {
            return false
        }
        
    }
    
    //写入文件
    static func writeToFile(object:Array<AccountInfoModel> , filename:String) -> Bool{
        if fileisExist(filename: filename) {
            deleteFile(filename: filename)
        }
        
        let content = NSKeyedArchiver.archivedData(withRootObject: object)
        
        return manager.createFile(atPath: createFilePah(filename: filename)!, contents: content, attributes: nil)
    }
    
    //删除文件
    static func deleteFile(filename:String?) {
        if filename != nil {
            let toUrl = createFilePah(filename: filename!)
            try! manager.removeItem(at: URL.init(string:toUrl!)!)

            print("delete file : " + toUrl!)
        }
    }
    

}


