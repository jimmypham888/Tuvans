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
    @IBOutlet weak var searchImageView: UIImageView! {
        didSet {
            searchImageView.setImage(asset: Asset.search, withColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.54))
        }
    }
    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configList(listCounselor)
        configSearchField(searchField)
        setEndEditing()
    }
    
    private func configSearchField(_ field: UITextField) {
        field.delegate = self
    }

    private func configList(_ list: UITableView) {
        list.dataSource = self
        list.delegate = self
        list.separatorStyle = .none
        list.rowHeight = 249
        list.registerCell(type: VESCounselorCell.self)
    }
}

extension VESCounselorListVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension VESCounselorListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
}

extension VESCounselorListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: VESCounselorCell.self, for: indexPath)
        cell.updateWith { [weak self] in
            self?.navigationController?.pushViewController(VESCounselorDetailVC(), animated: true)
        }
        return cell
    }
}
