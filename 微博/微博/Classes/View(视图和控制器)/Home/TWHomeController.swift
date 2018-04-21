//
//  TWHomeController.swift
//  微博
//
//  Created by 仝兴伟 on 2018/4/21.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

import UIKit

class TWHomeController: TWBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 显示好友
    @objc private func showFriends () {
        let vc = TWDemoController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // 重写父类方法
    override func setupUI() {
        super.setupUI()
        
        // 设置导航栏按钮
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriends))
        
    }
}

extension TWHomeController {
   
}
