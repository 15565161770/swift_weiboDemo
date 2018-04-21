//
//  TWNavigationController.swift
//  微博
//
//  Created by 仝兴伟 on 2018/4/21.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

import UIKit

class TWNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 隐藏默认的NavigationBar
        navigationBar.isHidden = true
    }
    
    // 重写push方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        // 如果不是栈底控制器才去隐藏，跟控制器不需要处理
        if childViewControllers.count > 0 {
            // 隐藏tabbar
            viewController.hidesBottomBarWhenPushed = true
            
            // 判断控制器的类型
            if let vc = viewController as? TWBaseViewController {
                var title = "返回"
                if childViewControllers.count == 1 {
                    // 显示首页的标题
                    title = childViewControllers.first?.title ?? "返回"
                }
                // 取出自定义的navItem
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(popToParent))
            }
        }
        super.pushViewController(viewController, animated: true)

    }
    
    // 返回到上一级
    @objc private func popToParent()  {
        popViewController(animated: true)
    }

}














