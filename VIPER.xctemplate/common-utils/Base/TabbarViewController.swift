//
//  TabbarViewController.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class TabbarViewController: UITabBarController, UITabBarControllerDelegate {
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.delegate = self
        
        initTabbarItemInterface()
        initChooseSavedListScreen()
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
     
       // NotificationCenter.default.removeObserver(self)
    
           self.tabBarController?.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func logout(_ notification: NSNotification)
    {
        
        if let tabBarController = UIApplication.shared.keyWindow?.rootViewController as? UITabBarController {
            tabBarController.selectedIndex = tabbarSelectIndex
            tabBarController.customizableViewControllers![0].navigationController?.popToRootViewController(animated: false)
        }
    }
    
   
    
    func initTabbarItemInterface(){
        self.tabBar.tintColor = UIColor(hex: "ffffff")
        self.tabBar.items![0].title = "ffffff"
        if #available(iOS 10.0, *) {
            self.tabBar.unselectedItemTintColor = UIColor(hex: "00e9e2")
        } else {
            // Fallback on earlier versions
        }
        
        
        
    }
    
    
  
    func initChooseSavedListScreen(){
        _ = view.bounds.width
        let _:CGFloat = 300
        
        
    }
    
    
    
    
    
    func notiTapHome(){
        let notificationName = NSNotification.Name("didTapHomeTabbar")
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
    
    
    func noticeReloadHomeExplore(){
        let notificationName = NSNotification.Name("shouldReloadHomeExplore")
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
    
    //    func checkLogin(){
    //        self.showLogin()
    //    }
    //
    //    private func showLogin()
    //    {
    //
    //        let vc = LOGIN_STORYBOARD_INSTANCE.instantiateViewController(withIdentifier: ControllerIdentifier.loginRegisterController)
    //        let navi = UINavigationController(rootViewController: vc)
    //        self.present(navi, animated: true, completion: nil)
    //
    //    }
    var tabbarSelectIndex = 0
    
}
