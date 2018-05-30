//
//  FirstViewController.swift
//  iWallet
//
//  Created by cmouse on 2018/5/15.
//  Copyright © 2018年 snailgames. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , UITableViewDataSource  {
    @IBOutlet weak var tableView: UITableView!
    
//    var datas : [(String,String,String)] = []
    var datas:Array = Array<AccountInfoModel>()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let indentifier = "workTableCell"

        let cell:CustomCell! = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath) as?CustomCell
        
        cell.initLabs(accountModel: datas[indexPath.row])
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if UtilClass.fileisExist(filename: Constant.FILE_WORK_NAME) {
            
            do {
                datas = try NSKeyedUnarchiver.unarchiveObject(with: UtilClass.readFromFile(filename: Constant.FILE_WORK_NAME)) as! Array<AccountInfoModel>
            } catch {
                switch (error){
                    default:print("Main:捕获到dog其他错误")
                }
            }
            
        }
        
        tableView.dataSource = self
//        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "workTableCell")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

