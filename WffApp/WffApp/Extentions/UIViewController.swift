//
//  UIViewController.swift
//  WFFApp
//
//  Created by Himanshu Singh on 09/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//
import UIKit
public extension UIViewController {
    func showButtonOnSearchBar(target:Any?,action:Selector?){
        self.navigationItem.searchController?.searchBar.showsCancelButton = true
        if let button = self.navigationItem.searchController?.cancelButton() {
            let iconImage = UIImage(named: "scan")
            button.setTitle("", for: .normal)
            button.isEnabled = true
            button.setImage(iconImage, for: .normal)
            if let selector = action{
                button.addTarget(target, action: selector, for: .touchUpInside)
            }
        }
    }
  @objc func setTittle(string:String){
       self.navigationItem.titleView = nil;
       self.title = string
   }
    @objc func setTittleImage(){
        self.setTitleImage(UIImage(imageLiteralResourceName: "wffLogo"))
    }
    private func setTitleImage(_ image : UIImage){
        let maxheight = (self.navigationController?.navigationBar.frame.size.height ?? 0) - 10
        let ratio = image.size.width/image.size.height
        let maxWidth = ratio * maxheight
        let size = CGRect(x:0, y: 0, width:maxWidth, height:maxheight)
        let imageView : UIImageView = UIImageView(frame: size)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    func adjustScrollingInsets(){
        extendedLayoutIncludesOpaqueBars = false
        automaticallyAdjustsScrollViewInsets = false
        
    }
    
    //Left to Right
    func pushViewController(_ viewController:UIViewController) {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = .reveal
        transition.subtype = CATransitionSubtype.fromRight
        transition.isRemovedOnCompletion = true
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(viewController, animated: false)
        
        
    }
    
    // Right to Left
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func dissmissNavigationController(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func popToViewController(_ viewController : UIViewController){
        
        self.navigationController?.popToViewController(viewController, animated: false)
        
    }
    
    
}

//
enum ValidationResult{
    case empty
    case valid
    case invalid
}

class BlockBarButtonItem: UIBarButtonItem {
    private var actionHandler: (() -> ())?
    
    convenience init(title: String?, style: UIBarButtonItem.Style, actionHandler: (() -> ())?) {
        self.init(title: title, style: style, target: nil, action: #selector(barButtonItemPressed))
        self.target = self
        self.actionHandler = actionHandler
    }
    
    convenience init(image: UIImage?, style: UIBarButtonItem.Style, actionHandler: (() -> ())?) {
        self.init(image: image, style: style, target: nil, action: #selector(barButtonItemPressed))
        self.target = self
        self.actionHandler = actionHandler
    }
    
    @objc func barButtonItemPressed(sender: UIBarButtonItem) {
        actionHandler?()
    }
}
