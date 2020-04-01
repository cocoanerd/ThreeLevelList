//
//  ViewController.swift
//  ThreeLevelList
//
//  Created by cocoanerd on 03/27/2020.
//  Copyright (c) 2020 cocoanerd. All rights reserved.
//

import UIKit
import ThreeLevelList

class ViewController: UIViewController {
    
    let cellHeight: CGFloat = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        filterData()
    }
    
    func filterData() {
        
        let array = [
            ["descript": "商学院",
             "secondLevelData":[
                [
                    "descript": "会计学",
                    "thirdLevelData": [
                    [
                        "descript": "会计学1班",
                    ],
                    [
                        "descript": "会计学1班"
                    ]
                    ]
                ],
                [
                    "descript": "人力资源管理",
                    "thirdLevelData": [
                    [
                        "descript": "人力资源管理1班",
                    ]
                    ]
                ]
                ]
            ],
            ["descript": "计算机学院",
             "secondLevelData":[
                [
                    "descript": "计算机科学",
                    "thirdLevelData": [
                    ]
                ],
                [
                    "descript": "软件工程",
                    "thirdLevelData": [
                    [
                        "descript": "软件工程1班",
                    ],
                    [
                        "descript": "软件工程1班"
                    ]
                    ]
                ]
                ]
            ]
        ]
        
        var dataArray: [MultiLevelModel] = []
        // 一级
        for (i, frist) in array.enumerated() {
            let fristModel = MultiLevelModel()
            fristModel.fristIndex = i + 1
            fristModel.isShow = true
            fristModel.currentLevel = .frist
            fristModel.descript = frist["descript"] as? String;
            dataArray.append(fristModel)
            //二级
            let secondLevelData = frist["secondLevelData"] as! [[String: Any]]
            for (j, second) in secondLevelData.enumerated(){
                let secondModel = MultiLevelModel()
                secondModel.fristIndex = i + 1
                secondModel.secondIndex = j + 1
                secondModel.currentLevel = .second
                secondModel.descript = second["descript"] as? String
                dataArray.append(secondModel)
                //三级
                let thirdLevelData = second["thirdLevelData"] as! [[String: Any]]
                for (k, third) in thirdLevelData.enumerated(){
                    let thirdModel = MultiLevelModel()
                    thirdModel.fristIndex = i + 1
                    thirdModel.secondIndex = j + 1
                    thirdModel.thirdIndex = k + 1
                    thirdModel.currentLevel = .third
                    thirdModel.descript = third["descript"] as? String
                    dataArray.append(thirdModel)
                }
            }
        }
    
        tableView.bindingData(data: dataArray)
    }
    
    fileprivate lazy var tableView: MultiLevelTableView = {
        
        let view = MultiLevelTableView.init(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: UITableView.Style.plain)
        view.bgColor = UIColor.white
        return view
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

