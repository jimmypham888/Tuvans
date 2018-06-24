//
//  VESCounselorListVC.swift
//  Venus
//
//  Created by Jimmy Pham on 6/9/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit

class VESCounselorListVC: VESBaseViewController {

    @IBOutlet weak var listCounselor: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configList(listCounselor)
    }

    private func configList(_ list: UITableView) {
        list.dataSource = self
        list.separatorStyle = .none
        list.rowHeight = 160
        list.registerCell(type: VESCounselorCell.self)
        list.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
    }
}

extension VESCounselorListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: VESCounselorCell.self, for: indexPath)
        cell.updateWith { [weak self] in
            self?.navigationController?.pushViewController(VESCounselorDetailVC(), animated: true)
        }
        return cell
    }
}
