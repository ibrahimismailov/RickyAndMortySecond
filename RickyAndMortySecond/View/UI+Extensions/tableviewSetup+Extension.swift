//
//  tableviewSetup+Extension.swift
//  RickyAndMortySecond
//
//  Created by Abraam on 27.11.2022.
//

import UIKit
extension UITableView {
    func  setupTableView(tablevieww: UITableView, view: UIView) {
        tablevieww.frame = CGRect(x: 20, y: view.frame.height, width: view.frame.width - 40, height: view.frame.height / 2)
        tablevieww.layer.cornerRadius = 10
        tablevieww.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tablevieww.layer.shadowOffset = CGSize(width: 0.8, height: 0.6)
        tablevieww.layer.shadowRadius = 2
        tablevieww.layer.shadowOpacity = 2
        tablevieww.backgroundColor = .systemGray6
    }
    func animateTableView(tableVieww: UITableView, tag: Int ,view: UIView, load: Bool) {
        if load {
            UIView.animate(withDuration: 0.3) {
                tableVieww.frame = CGRect(x: 4, y: view.frame.height / 2.0, width: view.frame.width - 10, height: view.frame.height - 170)
            }
        }else {
            UIView.animate(withDuration: 0.3, animations: {
                tableVieww.frame = CGRect(x: 20, y: view.frame.height, width: view.frame.width - 40, height: view.frame.height - 170)
            }) { done in
                for subView in view.subviews {
                if  subView.tag == tag {
                    subView.removeFromSuperview()
                    }
                }
            }
        }
    }
}
