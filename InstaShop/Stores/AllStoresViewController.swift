//
//  AllStoresViewController.swift
//  InstaShop
//
//  Created by Ahmed Mh on 20/10/2018.
//  Copyright © 2018 Ahmed Mh. All rights reserved.
//

import UIKit


class AllStoresViewController: UIViewController {

    var pageMenu : CAPSPageMenu?
    var pageMenuConfig : [CAPSPageMenuOption]!
    override func viewDidLoad() {
        super.viewDidLoad()
        //NotificationCenter.default.addObserver(self, selector: #selector(self.notificationReceived(_:)), name: .address, object: nil)
        
        edgesForExtendedLayout = []
        pageMenuConfig = [
            .SelectionIndicatorHeight(0.0)
            ,.MenuItemSeparatorWidth(1.0)
            ,.MenuItemSeparatorPercentageHeight(0.7)
            ,.MenuItemSeparatorColor(UIColor.lightGray)
            ,.MenuItemSeparatorRoundEdges(true)
            ,.ScrollMenuBackgroundColor(UIColor.white)
            ,.ViewBackgroundColor(UIColor.clear)
            ,.SelectionIndicatorColor(UIColor.green)
            ,.MenuMargin(0.0)
            ,.MenuItemWidth(UIScreen.main.bounds.width/3)
            ,.MenuHeight(50.0)
            ,.CenterMenuItems(false)
            ,.HideTopMenuBar(false)
          
        ]
        var controllerArray = [ListAllStoreViewController]()
        let controller1 : ListAllStoreViewController = ListAllStoreViewController()
       // controller1.view.backgroundColor = UIColor.purple
        controller1.title = "PURPLE"
        controllerArray.append(controller1)
        
        let controller2 : UIViewController = ListAllStoreViewController()
        //controller2.view.backgroundColor = UIColor.orange
        controller2.title = "ORANGE"
        controllerArray.append(controller2 as! ListAllStoreViewController)
        
        let controller3 : UIViewController = ListAllStoreViewController()
        controller3.view.backgroundColor = UIColor.gray
        controller3.title = "GRAY"
        controllerArray.append(controller3 as! ListAllStoreViewController)
        
        let controller4 : UIViewController = ListAllStoreViewController()
        //controller4.view.backgroundColor = UIColor.brown
        controller4.title = "BROWN"
        controllerArray.append(controller4 as! ListAllStoreViewController)
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: pageMenuConfig)
        
        self.addChildViewController(pageMenu!)
        pageMenu!.view.frame = self.view.bounds
        pageMenu!.view.autoresizesSubviews = false
        
        pageMenu!.view.transform = CGAffineTransform(scaleX: -1, y: 1)
        pageMenu!.menuItems.forEach { (item) in
            item.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        pageMenu!.controllerArray.forEach { (viewController) in
            viewController.view.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        self.view.addSubview(pageMenu!.view)
        pageMenu!.didMove(toParentViewController: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func notificationReceived(_ notification: Notification) {
        guard let longitude = notification.userInfo?["longitude"] as? Double else { return }
        print ("longitude: \(longitude)")
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
