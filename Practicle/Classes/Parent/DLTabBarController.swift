//
//  DLTabBarController.swift
//  Practicle
//
//  Created by Devang Lakhani  on 3/11/22.
//  Copyright © 2022 Devang Lakhani. All rights reserved.
//

import UIKit

class DLTabBarController: UITabBarController {
    var tabBarView : CustomTabBarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        // Do any additional setup after loading the view.
    }
}
extension DLTabBarController {
    
    func prepareUI() {
        tabBar.isHidden = true
        addCustomTabBar()
    }
    
    func addCustomTabBar() {
        tabBarView = CustomTabBarView.getView()
        self.selectedIndex = 0
        tabBarView.getSelectedIndex { idx in
            self.selectedIndex = idx
        }
        view.addSubview(tabBarView)
    }
}

