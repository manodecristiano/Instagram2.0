//
//  UITapBarController.swift
//  Instagram2.0
//
//  Created by Cristian Carreño Navarro on 27/02/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//

import UIKit

class UITapBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
   
        
    
        
        
        // cambiamos el color si esta seleccionado o no Ajustes comunes del TabBar.
    UITabBar.appearance().barTintColor = UIColor.black
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.yellow], for: .selected)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .normal)
        
        
        print(self.tabBar.items?.count as Any)
        //Modificar cada elemento del TapBar
        
        //HOME
        tabBarItem = self.tabBar.items![0]
        tabBarItem.image =
            UIImage(named: "iconoHome.png")?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage =
            UIImage(named:"iconoHometocado.png")?.withRenderingMode(.alwaysOriginal)
            tabBarItem.title = "home"
        //SEARCH
        tabBarItem = self.tabBar.items![1]
        tabBarItem.image =
            UIImage(named: "iconoSearch.png")?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage =
            UIImage(named:"iconoSearchtocado.png")?.withRenderingMode(.alwaysOriginal)
            tabBarItem.title = "search"
        //PERFIL
        tabBarItem = self.tabBar.items![2]
        tabBarItem.image =
            UIImage(named: "iconoPerfil.png")?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage =
            UIImage(named:"iconoPerfiltocado.png")?.withRenderingMode(.alwaysOriginal)
            tabBarItem.title = "perfil"
        //ABOUT
        tabBarItem = self.tabBar.items![3]
        tabBarItem.image =
            UIImage(named: "iconoAbout.png")?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage =
            UIImage(named:"iconoAbouttocado.png")?.withRenderingMode(.alwaysOriginal)
            tabBarItem.title = "about"
    }
    
    
    
    
}
