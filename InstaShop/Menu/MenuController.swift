//
//  MenuController.swift
//  GenericApp
//
//  Created by Ahmed Mh on 2/12/18.
//  Copyright © 2018 Machinestalk. All rights reserved.
//

import UIKit
import MFSideMenu

class MenuController: BaseController {
    fileprivate var menuItems = ["Dashboard_txt" ,"Assets_text", "Geo_fences_text", "PlaceMarks_text","Settings_txt","Logout_txt"]
    @IBOutlet weak var EmailLbl: Label!
    @IBOutlet weak var RoleLbl: Label!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var AboutBtn: Button!
    @IBOutlet weak var UserBtn: UIButton!
    @IBOutlet weak var ContactUSBtn: Button!
    @IBOutlet weak var TermBtn: Button!
    @IBOutlet weak var PrivatyBtn: Button!
    @IBOutlet weak var VersionLbl: UILabel!
    @IBOutlet weak var TblHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var content_view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
      /*  UserBtn = SetCircleUIButton(button : UserBtn)
        let appUser = CDUserModel.getUserData()
        EmailLbl.text  = appUser?.givenName*/
        self.setMenu(menuItems: self.menuItems as NSArray)
        // Do any additional setup after loading the view.
        self.tableView.backgroundColor = UIColor.clear
        content_view.backgroundColor = UIColor(red: 15/255, green: 99/255, blue: 155/255, alpha: 1)
        self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: UIScreen.main.bounds.size.height)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnProfileBtnTap(_ sender: Any) {
            self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: {
                
            })
           /* let vc = ProfilViewController(nibName: "ProfilViewController", bundle: nil)
            let navC = self.menuContainerViewController.centerViewController as! UINavigationController
            navC.setViewControllers([vc], animated: true)*/
    }
    
    @IBAction func OnAboutBtnTap(_ sender: Any) {
    }
    
    @IBAction func OnContactBtnTap(_ sender: Any) {
    }
    @IBAction func OnTermBtnTap(_ sender: Any) {
    }
    
    @IBAction func OnPrivacyBtnTap(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func setMenu(menuItems:NSArray)  {
        self.menuItems = menuItems as! [String]
        TblHeightConstraint.constant = CGFloat(self.menuItems.count * 33)
        self.tableView .reloadData()
    }
}

// extensions related to UItableView

extension MenuController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     /*   switch indexPath.row {
        case 0:
            self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: {
                
            })
            let vc = DashboardViewController(nibName: "DashboardViewController", bundle: nil)
            let navC = self.menuContainerViewController.centerViewController as! UINavigationController
            navC.setViewControllers([vc], animated: true)
            break
        case 1 :
            do {
                self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: {
                    
                })
                let vc = AssetsListController(nibName: "AssetsListController", bundle: nil)
                let navC = self.menuContainerViewController.centerViewController as! UINavigationController
                navC.setViewControllers([vc], animated: true)
                // resetDefaults()
                break
            }
        case 2 :
            do {
                self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: {
                    
                })
                let vc = ZonesListViewController(nibName: "ZonesListViewController", bundle: nil)
                let navC = self.menuContainerViewController.centerViewController as! UINavigationController
                navC.setViewControllers([vc], animated: true)
                break
            }
        case 3 :
            do {
            self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: {
            
        })
                let vc = PlaceMarksListViewController(nibName: "PlaceMarksListViewController", bundle: nil)
                let navC = self.menuContainerViewController.centerViewController as! UINavigationController
                navC.setViewControllers([vc], animated: true)
                break
            }
        
        case 4 :
            do {
                self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: {
                    
                })
                let vc = SettingsViewController(nibName: "SettingsViewController", bundle: nil)
                let navC = self.menuContainerViewController.centerViewController as! UINavigationController
                navC.setViewControllers([vc], animated: true)
                // resetDefaults()
                break
            }
        case 5 :
           
            do {
                self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: {
                    
                })
                 let alert = UIAlertController(title: "FMS", message: "logoutAlertMessage".localiz(), preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "YesText".localiz(), style: .default, handler: { action in
                    
                    CDUserModel.delete()
                    CDPlaceMark.delete()
                    CDAsset.delete()
                    CDZone.delete()
                    let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
                    let navC = self.menuContainerViewController.centerViewController as! UINavigationController
                    navC.setViewControllers([vc], animated: true)
                    
                }))
                alert.addAction(UIAlertAction(title: "Cancel_Txt".localiz(), style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                alert.view.tintColor = UIColor.blue
                
                // resetDefaults()
                break
            }
        default:
            print("Default")
        }*/
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}

extension MenuController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return menuItems.count ;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = self.menuItems[(indexPath as NSIndexPath).row].localiz()
        cell.textLabel?.textColor = UIColor.white
        cell.selectionStyle = .none
        
        return cell
    }
}
