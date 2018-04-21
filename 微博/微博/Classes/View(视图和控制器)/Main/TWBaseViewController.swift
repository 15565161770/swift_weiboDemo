//
//  TWBaseViewController.swift
//  微博
//
//  Created by 仝兴伟 on 2018/4/21.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

import UIKit

class TWBaseViewController: UIViewController {

    // 自定义导航条只是一个条子
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    // 自定义导航条目内容
    lazy var navItem = UINavigationItem()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        // 添加导航条
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
    }
    
    // 重写 title的didset方法
    override var title: String? {
        didSet{
           navItem.title = title
        }
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.cz_random()
    }
}



































