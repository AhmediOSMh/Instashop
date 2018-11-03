//
//  ListAllStoreViewController.swift
//  InstaShop
//
//  Created by Ahmed Mh on 02/11/2018.
//  Copyright © 2018 Ahmed Mh. All rights reserved.
//

import UIKit

class ListAllStoreViewController: BaseViewController ,UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet var tableview: UITableView!
    
    var table_data = [[String:Any]]()
    var params: [String: Any] = [:]
    struct TableData
    {
        var section:String = ""
        var data = Array<String>()
        init(){}
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let userDefaults = Foundation.UserDefaults.standard
        let mydict = userDefaults.object(forKey: "myDict") as! [String : Any]
        self.params.updateValue("1" , forKey: "id_cat")
        self.params.updateValue(mydict["longitude"] ?? "", forKey: "lon")
        self.params.updateValue(mydict["latitude"] ?? "", forKey: "lat")
      
        getAllStore()
        tableview.dataSource = self
        tableview.delegate = self
        self.tableview.register(AllStoresCell.self, forCellReuseIdentifier: "AllStoresCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell:AllStoresCell = self.tableview.dequeueReusableCell(withIdentifier: "AllStoresCell") as! AllStoresCell
      
        if let Name = table_data[indexPath.row]["Name"]  {
            cell.StoreName.text = Name as? String
        }
    
      
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func  getAllStore() {
        
        AppDelegate.showLoader()
        StoresServices().getAllStores(params: params) { (result) in
            DispatchQueue.main.async {
                AppDelegate.hideLoader()
                if let result = result {
                    self.table_data = result
                    self.tableview.reloadData()
                    self.alert(message: "Succes authentication")
                } else {
                    self.alert(message: "Fail Authentication")
                }
            }
        }
    }
}
