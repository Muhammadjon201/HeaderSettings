//
//  TableCell.swift
//  TestSettingsSnapkit
//
//  Created by ericzero on 10/31/22.
//

import UIKit
import SnapKit

class TableCell: UITableViewCell {

    let containerView = UIView()
    let image = UIImageView()
    let title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: "reuseidentifier")
        createSubviews()
           
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    func initData(_ info: Info){
        image.image = UIImage(named: info.image ?? "")
        title.text = info.title ?? ""
    }
    func initSubViews() {
        
        containerView.clipsToBounds = true
        containerView.layer.borderColor = UIColor.systemGray2.cgColor
        containerView.layer.borderWidth = 0.5
        containerView.layer.cornerRadius = 7
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
                
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .clear
        
        title.font = .systemFont(ofSize: 17)
        title.textColor = .black
        title.numberOfLines = 1
    }
    
    func addedViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(image)
        containerView.addSubview(title)
    }
    
    func addedConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        }
        
        image.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.height.equalTo(25)
            make.width.equalTo(image.snp.height)
        }
        title.snp.makeConstraints { make in
            make.centerY.equalTo(image.snp.centerY)
            make.left.equalTo(image.snp.right).offset(10)
            make.right.equalTo(-10)
        }
        
    }
    
    func createSubviews() {
           initSubViews()
            addedViews()
           addedConstraints()
       }
    
}

