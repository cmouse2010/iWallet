//
//  AppDelegate.swift
//  iWallet
//
//  Created by cmouse on 2018/5/15.
//  Copyright © 2018年 snailgames. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        let objects = try? NSKeyedUnarchiver.unarchiveObject(with: UtilClass.readFromFile(filename: "d.txt")) as? Array<AccountInfoModel>
//        
//        print (objects??.first!.account)
//        
        var objs:Array = [AccountInfoModel]()
        
        objs.append(AccountInfoModel(account: "1", pwd: "2", title: "1"))
        objs.append(AccountInfoModel(account: "2", pwd: "22", title: "2"))
        objs.append(AccountInfoModel(account: "3", pwd: "23", title: "3"))
        
        objs.append(AccountInfoModel(account: "1", pwd: "2", title: "4"))
        objs.append(AccountInfoModel(account: "11", pwd: "22", title: "5"))
        objs.append(AccountInfoModel(account: "12", pwd: "23", title: "6"))
        
        objs.append(AccountInfoModel(account: "1", pwd: "2", title: "7"))
        objs.append(AccountInfoModel(account: "11", pwd: "22", title: "8"))
        objs.append(AccountInfoModel(account: "12", pwd: "23", title: "9"))
        
        print (UtilClass.writeToFile(object: objs, filename: Constant.FILE_WORK_NAME))
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

