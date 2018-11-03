//
//  BaseController.swift
//  GenericApp
//
//  Created by Ahmed Mh on 2/12/18.
//  Copyright © 2018 Machinestalk. All rights reserved.
//

import UIKit
import MFSideMenu

class BaseController: UIViewController ,UITextFieldDelegate  {
    var selectedImage = UIImage.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    //MARK:- UITextField Delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //MARK:- Set Up Navigation bar
    func setupNavigationBar()  {
     
        let button : UIBarButtonItem
        if let window = UIApplication.shared.delegate?.window {
            if var viewController = window?.rootViewController {
                // handle navigation controllers
                if(viewController is UINavigationController){
                    viewController = (viewController as! UINavigationController).visibleViewController!
                }
                if(viewController is MFSideMenuContainerViewController){
                   
                    viewController = (viewController as! MFSideMenuContainerViewController).centerViewController as! UIViewController
                    viewController = (viewController as! UINavigationController).visibleViewController!
                    if(viewController is GPSViewController ||  self.navigationController?.viewControllers.count == 1 ){
                        button = UIBarButtonItem(image: UIImage(named: "menu-icon"), style: .plain, target: self, action: #selector(menuButtonPressed))
                    }
                    else {
                        button = UIBarButtonItem(image: UIImage(named: "back-arrow"), style: .plain, target: self, action: #selector(backButtonPressed))
                    }
                    var leftNavigationButtons = NSMutableArray(array: self.navigationBarLeftButtons())
                    leftNavigationButtons.add(button)
                    self.navigationItem.leftBarButtonItems  = leftNavigationButtons as! [UIBarButtonItem]
            }
        }
        }
        }
    
    func navigationBarLeftButtons() -> [UIBarButtonItem] {
        return []
    }
    
    @objc func menuButtonPressed()  {

        if(LanguageManger.shared.isRightToLeft==true){
            
            self.menuContainerViewController.toggleRightSideMenuCompletion({
                    
                })
                
            }
        else {
                self.menuContainerViewController.toggleLeftSideMenuCompletion({
                    
                })
            
        }
       
    }
    @objc func backButtonPressed()  {
        self.navigationController?.popViewController(animated: true)
    }
    func setupLeftNavigationButtons(NavigationBarItems : NSArray)  {
      /*  self.navigationItem.setLeftBarButtonItems(nil, animated: false)
        let barButtons:NSArray
        barButtons= self.createBarButtons*/
        
    }
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
   
    func setTitle(title : String){
       // super.title  = title.localized(lang: la)
    }
    //MARK:- UITextField Delegate Methods
    
    
}
// MARK: - UINavigationControllerDelegate
extension BaseController: UINavigationControllerDelegate {
}

// MARK: - UIImagePickerControllerDelegate
extension BaseController: UIImagePickerControllerDelegate {
    func presentImagePicker() {
        // 2
        let imagePickerActionSheet = UIAlertController(title: "Base_Update_user_Image_Lbl".localiz(),
                                                       message: nil, preferredStyle: .actionSheet)
        imagePickerActionSheet.view.tintColor =  UIColor(red: 15/255, green: 99/255, blue: 155/255, alpha: 1)
        // 3
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraButton = UIAlertAction(title: "Base_Take_photo_Lbl".localiz(),
                                             style: .default) { (alert) -> Void in
                                                let imagePicker = UIImagePickerController()
                                                imagePicker.delegate = self
                                                imagePicker.sourceType = .camera
                                                self.present(imagePicker, animated: true)
            }
            imagePickerActionSheet.addAction(cameraButton)
        }
        // 1
        let libraryButton = UIAlertAction(title: "Base_Choose_existing_Lbl".localiz(),
                                          style: .default) { (alert) -> Void in
                                            let imagePicker = UIImagePickerController()
                                            imagePicker.delegate = self
                                            imagePicker.sourceType = .photoLibrary
                                            self.present(imagePicker, animated: true)
        }
        imagePickerActionSheet.addAction(libraryButton)
        // 2
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        imagePickerActionSheet.addAction(cancelButton)
        // 3
        present(imagePickerActionSheet, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        dismiss(animated: true, completion: {

        })
        }
    
}


