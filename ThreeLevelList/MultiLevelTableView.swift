//
//  MultiLevelTableView.swift
//  ThreeLevelList
//
//  Created by mmh on 2020/3/27.
//

import UIKit

let kMultiLevelBaseCellIdentifier = "kMultiLevelBaseCellIdentifier"

public class MultiLevelTableView: UITableView {
    
    /// 背景色
    public var bgColor: UIColor = UIColor.white
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.backgroundColor = bgColor
        self.delegate = self
        self.dataSource = self
        self.tableFooterView = UIView(frame: .zero)
        self.separatorInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        self.register(MultiLevelBaseCell.self, forCellReuseIdentifier: kMultiLevelBaseCellIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func bindingData(data: [MultiLevelModel]) {
        self.dataModel.totalData = data
        self.reloadData()
    }
    
    fileprivate lazy var dataModel: MuliLevelDataModel = {
        let model = MuliLevelDataModel()
        return model
    }()
}

extension MultiLevelTableView: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentModel = self.dataModel.totalData?[indexPath.row]
        switch currentModel?.currentLevel {
        case .frist:
            var indexPathArray: [IndexPath] = []
            if true == currentModel?.isOpen {
                for (index, model) in (self.dataModel.totalData?.enumerated())! {
                    //关闭全部非一级列表的当前组的展开的cell
                    let is_belong = model.fristIndex == currentModel?.fristIndex
                    if !(model.currentLevel == .frist) && is_belong && model.isShow {
                        model.isShow = !model.isShow
                        let indexP = IndexPath.init(row: index, section: 0)
                        indexPathArray.append(indexP)
                    }
                }
            } else {
                for (index, model) in (self.dataModel.totalData?.enumerated())! {
                    //展开一级cell对应的二级cell
                    let is_belong = model.fristIndex == currentModel?.fristIndex
                    let is_current = model == currentModel
                    if is_belong && !is_current && model.currentLevel == .second {
                        model.isShow = !model.isShow
                        let indexP = IndexPath.init(row: index, section: 0)
                        indexPathArray.append(indexP)
                    }
                }
            }
            
            tableView .reloadRows(at: indexPathArray, with: .automatic)
            currentModel?.isOpen = !(currentModel?.isOpen ?? false)
            return
        case .second:
            var indexPathArray: [IndexPath] = []
            for (index, model) in (self.dataModel.totalData?.enumerated())! {
                //展开或关闭二级cell对应的三级cell
                let is_belong = model.fristIndex == currentModel?.fristIndex && model.secondIndex == currentModel?.secondIndex
                let is_current = model == currentModel
                if is_belong && !is_current && model.currentLevel == .third{
                    model.isShow = !model.isShow
                    let indexP = IndexPath.init(row: index, section: 0)
                    indexPathArray.append(indexP)
                }
            }
            tableView .reloadRows(at: indexPathArray, with: .automatic)
            return
        case .third:
            
            return
        case .none:
            return
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = self.dataModel.totalData?[indexPath.row]
        if model!.isShow {
            print("索引----:" , indexPath.row)
        }
        return (model?.isShow == true) ? 50: 0
    }
    
}

extension MultiLevelTableView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataModel.totalData?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kMultiLevelBaseCellIdentifier, for: indexPath) as! MultiLevelBaseCell
        cell.bindCell(model: self.dataModel.totalData?[indexPath.row] ?? MultiLevelModel())
        return cell
    }
    
}
