//
//  VESScheduleVC.swift
//  Venus
//
//  Created by Jimmy Pham on 8/18/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class VESScheduleVC: VESBaseViewController {
    
    @IBOutlet weak var scheduleList: UITableView!
    
    var ref = Database.database().reference()
    
    var scheduleListArr: [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure View
        configureView()
        
        // Load data
        loadData()
    }

    private func configureView() {
        // For view
        view.backgroundColor = ColorName.twilightBlue.color
        wrraperView.backgroundColor = ColorName.lightBlueGrey.color
        
        // For tableview
        scheduleList.dataSource = self
        scheduleList.delegate = self
        scheduleList.rowHeight = 112.0
        scheduleList.separatorStyle = .none
        scheduleList.allowsSelection = false
        scheduleList.registerCell(type: VESScheduleCell.self)
        scheduleList.contentInset = UIEdgeInsetsMake(0, 0, 8, 0)
    }
    
    /// Hàm này sẽ gọi dữ liệu từ firebase
    private func loadData() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        ref.child("customers").child(uid).observe(.value) { (snapshot) in
            let allObjects = snapshot.children.allObjects as? [DataSnapshot]
            
            self.scheduleListArr.removeAll()
            
            allObjects?.compactMap { $0 }.forEach({ (snapshot) in
                guard let dictionary = snapshot.value as? [String: Any] else { return }
                
                self.scheduleListArr.append(dictionary)
            })
            
            self.scheduleList.reloadData()
        }
        
//        let customer = ["email": email, "name": name, "phone": telNumber, "notes": notes, "counselor": counselor, "state": "0"]
//        ref.child("customers").child(uid).childByAutoId().setValue(customer) { (err, ref) in
//            SVProgressHUD.dismiss()
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                self.navigationController?.pushViewController(VESBookingSuccessViewController(), animated: true)
//                print("Document added with ID: \(ref.description())")
//            }
//        }
    }
}

extension VESScheduleVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return scheduleListArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: VESScheduleCell.self, for: indexPath)
        let data = scheduleListArr[indexPath.section]
        cell.updateWithData(data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
}
