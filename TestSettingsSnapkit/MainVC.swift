//
//  MainVC.swift
//  TestSettingsSnapkit
//
//  Created by ericzero on 10/31/22.
//

import UIKit
import SnapKit

class MainVC: UIViewController {

    let tableView = UITableView()
    
    let cellID = "TableCell"
    
    lazy var menuArr = [
        FullMenu(h: "Additional Information",
                 arr: [
            Info(img: "chat", tit: "Online chat with bank"),
            Info(img: "missed-call", tit: "Missed calls"),
            Info(img: "cv", tit: "My applications"),
                    
        ]),
        FullMenu(h: "settings",
                 arr: [
            Info(img: "point", tit: "Bank map"),
            Info(img: "agreement", tit: "Public offer"),
        ]),
        FullMenu(h: "Account",
                 arr: [
            Info(img: "documents", tit: "News"),
            Info(img: "russian", tit: "Language"),
            Info(img: "share", tit: "Share"),
        ]),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        createSubviews()
    }
    
    func createSubviews() {
        
        initSubviews()
        addedSubviews()
        constraintsSubviews()
    }
    
    func initSubviews() {
        
        //tableView.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableCell.self, forCellReuseIdentifier: "TableCell")
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        title = "Other"
    }
    
    func addedSubviews() {
        view.addSubview(tableView)
    }
    
    func constraintsSubviews() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.right.left.bottom.equalToSuperview()
        }
    }
  
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return menuArr[section].header ?? "eqwret"
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        menuArr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return menuArr[section].information.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
        cell.initData(menuArr[indexPath.section].information[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.section, indexPath.row)
    }
    
}
