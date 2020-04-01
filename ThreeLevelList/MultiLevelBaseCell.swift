//
//  MultiLevelBaseCell.swift
//  ThreeLevelList
//
//  Created by mmh on 2020/3/27.
//

import UIKit

class MultiLevelBaseCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        buildUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindCell(model: MultiLevelModel) {
        var depict: String = ""
        if (model.currentLevel == .frist) {
            depict = "① - " + (model.descript ?? "")
            self.backgroundColor = UIColor(red: 212/255.0, green: 226/255.0, blue: 208/255.0, alpha: 1)
        } else if (model.currentLevel == .second) {
            depict = "    ② - " + (model.descript ?? "")
            self.backgroundColor = UIColor(red: 212/255.0, green: 201/255.0, blue: 194/255.0, alpha: 1)
        } else if (model.currentLevel == .third){
            depict = "        ③ - " + (model.descript ?? "")
            self.backgroundColor = UIColor(red: 212/255.0, green: 177/255.0, blue: 175/255.0, alpha: 1)
        }
        contentLabel.text = (model.isShow == true) ? depict : ""
    }
    
    fileprivate func buildUI() {
        contentView.addSubview(contentLabel)
    }
    
    fileprivate lazy var contentLabel: UILabel = {
       let label = UILabel()
        label.frame = CGRect(x: 12, y: 0, width: UIScreen.main.bounds.size.width-24, height: 49.5)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    

}
