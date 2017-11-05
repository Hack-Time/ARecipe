//
//  AboutController.swift
//  ARecipe
//
//  Created by kingcos on 05/11/2017.
//  Copyright © 2017 kingcos. All rights reserved.
//

import UIKit

class AboutController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

// MARK: - Table view data source
extension AboutController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var urlString = "https://github.com/HACKxFDU-2017"
        switch indexPath.section {
        case 0:
            break
        case 1:
            switch indexPath.row {
            case 0:
                urlString = "https://www.baidu.com"
            case 1:
                urlString = "https://www.tencent.com"
            case 2:
                urlString = "https://www.taobao.com"
            default:
                urlString = "https://www.xiaomi.com"
            }
        default:
            switch indexPath.row {
            case 0:
                urlString = "https://github.com/HACKxFDU-2017"
            default:
                urlString = ""
            }
        }
        
        let controller = WebController()
        controller.urlString = urlString
        navigationController?.pushViewController(controller, animated: true)
    }
}
