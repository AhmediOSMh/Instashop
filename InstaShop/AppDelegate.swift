//
//  AppDelegate.swift
//  InstaShop
//
//  Created by Ahmed Mh on 06/10/2018.
//  Copyright © 2018 Ahmed Mh. All rights reserved.
//

import UIKit
import CoreData
import MFSideMenu
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var sideMenu : MFSideMenuContainerViewController?
    var navVC:UINavigationController?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
         LanguageManger.shared.defaultLanguage = .en
        UserDefaults.standard.set("en", forKey: "selectedLanguage")
        L102Localizer.DoTheMagic()
      /*  let navVC:UINavigationController = UINavigationController(rootViewController: SignInViewController())
        self.window?.rootViewController = navVC;*/
        LanguageManger.shared.defaultLanguage = .ar
        let userDefaults = Foundation.UserDefaults.standard
        if userDefaults.string(forKey: "selectedLanguage") == nil || userDefaults.string(forKey: "selectedLanguage") == "" {
            if(LanguageManger.shared.isRightToLeft==true)
            {
                language = "ar"
                userDefaults.set( language, forKey: "selectedLanguage")
                LanguageManger.shared.defaultLanguage = .ar
            }
            else {
                language = "en"
                userDefaults.set( language, forKey: "selectedLanguage")
                LanguageManger.shared.defaultLanguage = .en
            }
        } else {
            language = userDefaults.string(forKey: "selectedLanguage")!
            if language == "ar" {
                LanguageManger.shared.defaultLanguage = .ar
            } else {
                LanguageManger.shared.defaultLanguage = .en
            }
            
        }
        self.window = UIWindow(frame:UIScreen.main.bounds)
       /* if  (CDUserModel.getUserData() != nil) {
            self.window?.rootViewController = self.getLandingPageWithSideMenu()
        } else {*/
            let centerVC = SignInViewController()
            centerVC.view.backgroundColor = UIColor.white;
            var navVC:UINavigationController = UINavigationController(rootViewController: centerVC)
        UINavigationBar.appearance().barTintColor = UIColorFromHex(hex: "#0D6E55")
        
            UINavigationBar.appearance().tintColor = UIColor.white
            self.window?.rootViewController = navVC;
       // }
        self.window?.tintColor = UIColor.white
        self.window?.makeKeyAndVisible()
        GMSServices.provideAPIKey(GoogleMapKey)
        return true
    }
    func enableSideMenuPan (isEnabled:Bool){
        
        sideMenu?.panMode = (isEnabled) ? MFSideMenuPanModeDefault : MFSideMenuPanModeNone
        
    }
    
    func getNavControllerWithRootController(controller : BaseController)->UINavigationController{
        self.navVC = UINavigationController(rootViewController: controller)
        self.navVC?.interactivePopGestureRecognizer?.isEnabled = true
        return self.navVC!
    }
    func getLandingPageWithSideMenu()->UIViewController {
        
        self.navVC = self.getNavControllerWithRootController(controller: GPSViewController())
        let leftController = MenuController()
        let rightController = MenuController()
        
        sideMenu = MFSideMenuContainerViewController.container(withCenter: navVC, leftMenuViewController: leftController, rightMenuViewController: rightController)
        sideMenu?.menuContainerViewController.panMode = MFSideMenuPanModeNone
        
        return sideMenu!
    }
    
    
    func getInstance()->AppDelegate{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate
    }
    func getSideMenuController ()-> MenuController {
        let controller:MenuController = LanguageManger.shared.isRightToLeft == true ? sideMenu!.rightMenuViewController as! MenuController : sideMenu!.leftMenuViewController as! MenuController
        
        return controller
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
        // Saves changes in the application's managed object context before the application terminates.
    }

    

}

