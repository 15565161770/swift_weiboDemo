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
        // 添加按钮
        setupComposeButton()
    }
    
    // MARK -- 中间按钮监听方法
    // private 能够帮助方法私有。仅在当前对象被访问
    // objc允许这个函数在运行时 通过objc的消息机制调用
    @objc private func composeStatus()  {
        
    }

    // 定义私有属性
    private lazy var composeButton:UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
}

// extension 类似于oc中的分类，在swfit中可以切分代码块
// 可以把相近功能的函数，放到一个extension中
// 便于代码维护
// 注意:和oc的分类一样，extension中不能定义属性
// MARK -- 设置界面 --

extension TWMainViewController {
    
    private func setupComposeButton() {
        tabBar.addSubview(composeButton)
        // 计算按钮宽度
        let count = CGFloat(childViewControllers.count)
        // 容错点像素为1，将宽度缩小
        let w = tabBar.bounds.width / count - 1
        // 正数向内缩进，负数往外扩展
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        
        // 添加监听方法
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
    }
    
    
    // 设置所以子控制器
    private func setupChildControllers(){
        let array = [
            ["clsName":"TWHomeController", "title":"首页", "imgName":"home"],
            ["clsName":"TWMessageController", "title":"消息", "imgName":"message_center"],
            ["clsName":"UIViewController"],
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
        
        // 设置 tabbar标题颜色
        // 4. 设置 tabbar 的标题字体（大小）
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedStringKey.foregroundColor: UIColor.orange],
            for: .highlighted)
        // 系统默认是 12 号字，修改字体大小，要设置 Normal 的字体大小
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)],
            for: UIControlState(rawValue: 0))
        
        // 5 实例化导航控制器的时候，会调用 push 方法将 rootVC 压栈
        let nav = TWNavigationController(rootViewController: vc)
        return nav
    }
}
