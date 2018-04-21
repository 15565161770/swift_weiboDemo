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
            ["clsName":"TWHomeController", "title":"首页", "imgName":"home"],
            ["clsName":"TWMessageController", "title":"消息", "imgName":"message_center"],
            ["clsName":"TWDiscoverController", "title":"发现", "imgName":"discover"],
            ["clsName":"TWProfileController", "title":"我", "imgName":"profile"],
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
        
        // 3. 设置图像
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imgName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imgName + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        // 4 实例化导航控制器的时候，会调用 push 方法将 rootVC 压栈
        let nav = TWNavigationController(rootViewController: vc)
        return nav
    }
}


















