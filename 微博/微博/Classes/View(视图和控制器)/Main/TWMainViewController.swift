//
//  TWMainViewController.swift
//  微博
//
//  Created by 仝兴伟 on 2018/4/21.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

import UIKit

class TWMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 调用控制器
       setupChildControllers()
    }

}

// extension 类似于oc中的分类，在swfit中可以切分代码块
// 可以把相近功能的函数，放到一个extension中
// 便于代码维护
// 注意:和oc的分类一样，extension中不能定义属性
// MARK -- 设置界面 --

extension TWMainViewController {
    // 设置所以子控制器
    private func setupChildControllers(){
        let array = [
            ["clsName":"TWHomeController", "title":"首页", "imgName":""],
        ]
        
        var arrayM = [UIViewController]()
        for dict in array{
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
        
    }
    
    // 使用字典创建一个子控制器
    private func  controller(dict:[String: String]) -> UIViewController {
        
        guard let clsName = dict["clsName"], let title = dict["title"], let imgName = dict["imgName"], let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type else {
            return UIViewController()
        }
        
        // 2 创建视图控制器
        // 1> 将clsName转换成cls
        let vc = cls.init()
        vc.title = title
        let nav = TWNavigationController(rootViewController: vc)
        return nav
    }
}


















