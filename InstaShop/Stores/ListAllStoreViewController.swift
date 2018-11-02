//
//  ListAllStoreViewController.swift
//  InstaShop
//
//  Created by Ahmed Mh on 02/11/2018.
//  Copyright © 2018 Ahmed Mh. All rights reserved.
//

import UIKit

class ListAllStoreViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet var tableview: UITableView!
    
    var table_data = Array<TableData>()
    
    struct TableData
    {
        var section:String = ""
        var data = Array<String>()
        init(){}
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        self.tableview.register(UITableViewCell.self, forCellReuseIdentifier: "AllStoresCell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllStoresCell", for: indexPath) 
        
      
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

}
