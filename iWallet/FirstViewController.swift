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
    
    var datas : [(String,String,String)] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let indentifier = "workTableCell"
        
        var cell:CustomCell! = tableView.dequeueReusableCell(withIdentifier: indentifier)as?CustomCell
        
        if cell == nil {
            cell = CustomCell(style: .default, reuseIdentifier: indentifier)
        }
            cell.initLabs(data: datas[indexPath.row])
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        datas.append(("开发者帐号0","text","ssss_"))
        datas.append(("开发者帐号1","text2","ssss3"))
        datas.append(("开发者帐号4","text5","ssss6"))
        datas.append(("开发者帐号7","text8","ssss9"))
        
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "workTableCell")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

