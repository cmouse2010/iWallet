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
    static func createFilePah(filename:String?) -> URL?{
        let urlForDocument = manager.urls(for: .documentDirectory, in:.userDomainMask)
        let url = urlForDocument[0]
        if filename != nil {
            let fpath = url.appendingPathComponent(filename!)
//            print("create file path :" + fpath.path)
            return fpath
        } else {
            return nil
        }
        
    }
    
    //文件是否存在
    static func fileisExist(filename:String?) -> Bool {
        
        if let filename = filename {
            if let filePath = createFilePah(filename: filename) {
                return manager.fileExists(atPath: filePath.path)
            } else {
                return false
            }
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

        return manager.createFile(atPath: (createFilePah(filename: filename)?.path)!, contents: content, attributes: nil)
    }
    
    
    
    //删除文件
    static func deleteFile(filename:String?) {
        if filename != nil {
            if let toUrl = createFilePah(filename: filename!) {
                try! manager.removeItem(at: toUrl)
                print("delete file : " + toUrl.path)
            }
            
        }
    }
    
    //读取文件
    static func readFromFile(filename:String) throws -> Data {
        let fileHandle = try FileHandle(forReadingFrom: createFilePah(filename: filename)!)
        return fileHandle.readDataToEndOfFile()
    }
    

}


