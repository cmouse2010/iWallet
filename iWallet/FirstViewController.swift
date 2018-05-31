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
    @IBOutlet weak var addaccSubview: UIView!
    @IBOutlet weak var titleInputField: UITextField!
    @IBOutlet weak var pwdInputField: UITextField!
    @IBOutlet weak var accountInputField: UITextField!
    //    var datas : [(String,String,String)] = []
    var datas:Array = Array<AccountInfoModel>()
    
    //数据源
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
        
        //初使化数据
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
        
        //注册通知
        NotificationCenter.default.addObserver(self, selector: #selector(datasNotification(noti:)), name: NSNotification.Name(rawValue: Constant.NOTIFICATION_FIRSTVIEWCONTR_DATA_DEL), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(datasNotification(noti:)), name: NSNotification.Name(rawValue: Constant.NOTIFICATION_FIRSTVIEWCONTR_DATA_CHANGE), object: nil)

//        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "workTableCell")
        
        //子弹面弹出时点击不能穿透
//        self.addaccSubview.isUserInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func datasNotification(noti: Notification){
        
        switch noti.name {
        case NSNotification.Name(Constant.NOTIFICATION_FIRSTVIEWCONTR_DATA_DEL) :
            let data_title = noti.object as! String
            let index = findByTitle(title: data_title)
            if index != -1 {
                delByIndex(index: index)
            }
            break
            
        case NSNotification.Name(Constant.NOTIFICATION_FIRSTVIEWCONTR_DATA_CHANGE) :
            let data_title = noti.object as! String
            let index = findByTitle(title: data_title)
            if index != -1 {
                addaccSubview.isHidden = false
                titleInputField.text = datas[index].title
                accountInputField.text = datas[index].account
                pwdInputField.text = datas[index].pwd
            }
            break
            
        default: break
            
        }
        
        print(datas)
    }
    
    deinit {
        /// 移除通知
        NotificationCenter.default.removeObserver(self)
    }
    
    //数据处理工具方法
    func findByTitle(title:String) -> Int {
        var rtn = 0
        var isHave = false
        for account:AccountInfoModel in datas {
            if account.title == title {
                isHave = true
                break
            }
            rtn += 1
        }
        if isHave {
            return rtn
        } else {
            return -1
        }
        
    }
    
    func delByIndex(index:Int) -> Void {
        datas.remove(at: index)
        self.tableView.reloadData()
    }
    
    func saveData(accountinfo:AccountInfoModel) -> Void {
        guard let title = accountinfo.title else {return}
        delByIndex(index: findByTitle(title: title))
        datas.append(accountinfo)
    }
    
    //添加帐号子界面处理
    
    @IBAction func clickCloseBtn(_ sender: Any) {
        self.addaccSubview.isHidden = true
        clearData()
    }
    
    @IBAction func clickSaveBtn(_ sender: Any) {
        func getaccoutInfo() -> AccountInfoModel? {
            guard let mytitle = titleInputField.text,
                let account = accountInputField.text,
                let pwd = pwdInputField.text
                else {
                    return nil
            }
            
            return AccountInfoModel(account: account, pwd: pwd, title: mytitle)
        }
        
        let accountInfo = getaccoutInfo()
        
        saveData(accountinfo: accountInfo!)
        
        tableView.reloadData()
        
        addaccSubview.isHidden = true
    }
    
    @IBAction func clickCanelBtn(_ sender: Any) {
        self.addaccSubview.isHidden = true
        clearData()
    }
    
    func clearData() {
        self.titleInputField.text = ""
        self.accountInputField.text = ""
        self.pwdInputField.text = ""
    }
    
    
}

