//
//  CustomTabBarView.swift
//  Fade
//
//  Created by Devang Lakhani  on 4/8/21.
//  Copyright © 2021 Devang Lakhani. All rights reserved.
//

import UIKit

class CustomTabBarView: UIView {
    @IBOutlet var btnsMenu : [UIButton]!
    @IBOutlet var viewMenu: [UIView]!
    
    
    var completion : ((_ index : Int) -> ()) = {_ in}
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let TopBorder = CALayer()
        TopBorder.frame = CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: 1.0)
        TopBorder.backgroundColor = #colorLiteral(red: 0.7608392835, green: 0.7608573437, blue: 0.7608476281, alpha: 1)
        layer.addSublayer(TopBorder)
    }
    
    class func getView() -> CustomTabBarView{
        let customTabBar = UINib(nibName: "CustomTabBarView", bundle: nil).instantiate(withOwner: self, options: nil).first as! CustomTabBarView
        customTabBar.frame = CGRect(x: 0, y: (_screenSize.height - 65) - _bottomAreaSpacing, width: _screenSize.width, height: 65 + _bottomAreaSpacing)
        customTabBar.layoutIfNeeded()
        customTabBar.selectedIndexTintColor(index: 0)
        return customTabBar
    }
    
    func getSelectedIndex(completion: @escaping(Int) -> ()){
        self.completion = completion
    }
    
    func selectedIndexTintColor(index: Int){
        for btn in btnsMenu{
            btn.isSelected = btn.tag == index ? true : false
        }
    }
}


//MARK:- Button Action
extension CustomTabBarView{
    @IBAction func btnMenuTapped(_ sender: UIButton){
        self.selectedIndexTintColor(index: sender.tag)
        completion(sender.tag)
    }
}
