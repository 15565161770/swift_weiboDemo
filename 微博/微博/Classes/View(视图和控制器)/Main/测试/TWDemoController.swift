//
//  TWDemoController.swift
//  微博
//
//  Created by 仝兴伟 on 2018/4/21.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

import UIKit

class TWDemoController: TWBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "第\(String(describing: navigationController?.childViewControllers.count ?? 0))个"
    }
    
    @objc private func showNext() {
        let vc = TWDemoController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setupUI() {
        super.setupUI()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", target: self, action: #selector(showNext))
    }
    
}

extension TWDemoController {
    // 设置右侧控制器
}























