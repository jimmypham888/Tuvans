//
//  VESCounselorListVC.swift
//  Venus
//
//  Created by Jimmy Pham on 6/9/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class VESCounselorListVC: VESBaseViewController {

    @IBOutlet weak var listCounselor: UITableView!
    @IBOutlet weak var searchImageView: UIImageView! {
        didSet {
            searchImageView.setImage(asset: Asset.search, withColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.54))
        }
    }
    @IBOutlet weak var searchField: UITextField!
    
    private var fakeDataArrayDict: [Dictionary<String, Any>] = []
    private var searchResultFakeData: [Dictionary<String,Any>] = []
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configList(listCounselor)
        configSearchField(searchField)
        setEndEditing()
        fakeDataArrayDict = PlistUtility.ReadPlistArray("FakeCounselor")
        searchResultFakeData = fakeDataArrayDict
        listCounselor.reloadData()
    }
    
    private func configSearchField(_ field: UITextField) {
        field.delegate = self
        
        field
            .rx.text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] (query) in
                guard let strongSelf = self else { return }
                if query == "" {
                    strongSelf.searchResultFakeData = strongSelf.fakeDataArrayDict
                    strongSelf.listCounselor.reloadData()
                    return
                }
                strongSelf.searchResultFakeData = strongSelf.fakeDataArrayDict.filter({ (dict) -> Bool in
                    guard let name = dict["name"] as? String else { return false }
                    let isContains = name.lowercased().contains(query.lowercased())
                    return isContains
                })
                strongSelf.listCounselor.reloadData()
                
                let transition = CATransition()
                transition.type = kCATransitionFade
                transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                transition.fillMode = kCAFillModeForwards
                transition.duration = 0.5
                transition.subtype = kCATransitionFromTop
                strongSelf.listCounselor.layer.add(transition, forKey: "UITableViewReloadDataAnimationKey")
                // Update your data source here
                strongSelf.listCounselor.reloadData()
            })
            .disposed(by: disposeBag)
    }

    private func configList(_ list: UITableView) {
        list.dataSource = self
        list.delegate = self
        list.separatorStyle = .none
        list.rowHeight = 181.0
        list.registerCell(type: VESCounselorCellv2.self)
        list.contentInset = UIEdgeInsetsMake(0, 0, 8, 0)
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
        return searchResultFakeData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: VESCounselorCellv2.self, for: indexPath)
        let data = searchResultFakeData[indexPath.section]
        cell.updateWith(dict: data) {
            let counselorDetail = VESCounselorDetailVC(detail: data)
            self.navigationController?.pushViewController(counselorDetail, animated: true)
        }
        return cell
    }
}
