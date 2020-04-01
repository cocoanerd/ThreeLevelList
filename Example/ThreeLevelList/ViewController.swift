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
            ["descript": "一级类目1",
             "secondLevelData":[
                [
                    "descript": "二级类目1-1",
                    "thirdLevelData": [
                    [
                        "descript": "三级类目1-1-1",
                    ],
                    [
                        "descript": "三级类目1-1-2"
                    ]
                    ]
                ],
                [
                    "descript": "二级类目1-2",
                    "thirdLevelData": [
                    [
                        "descript": "三级级类目1-2-1",
                    ]
                    ]
                ]
                ]
            ],
            ["descript": "一级类目2",
             "secondLevelData":[
                [
                    "descript": "二级类目2-1",
                    "thirdLevelData": [
                    ]
                ],
                [
                    "descript": "二级类目2-2",
                    "thirdLevelData": [
                    [
                        "descript": "三级类目2-2-1",
                    ],
                    [
                        "descript": "三级类目2-2-2"
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
            let secondLevelData = frist["secondLevelData"] as! [[String: Any]]
            if secondLevelData.isEmpty {
                fristModel.needHandleEvent = true
            }
            dataArray.append(fristModel)
            //二级
            for (j, second) in secondLevelData.enumerated(){
                let secondModel = MultiLevelModel()
                secondModel.fristIndex = i + 1
                secondModel.secondIndex = j + 1
                secondModel.currentLevel = .second
                secondModel.descript = second["descript"] as? String
                let thirdLevelData = second["thirdLevelData"] as! [[String: Any]]
                if thirdLevelData.isEmpty {
                    secondModel.needHandleEvent = true
                }
                dataArray.append(secondModel)
                //三级
                for (k, third) in thirdLevelData.enumerated(){
                    let thirdModel = MultiLevelModel()
                    thirdModel.fristIndex = i + 1
                    thirdModel.secondIndex = j + 1
                    thirdModel.thirdIndex = k + 1
                    thirdModel.currentLevel = .third
                    thirdModel.descript = third["descript"] as? String
                    thirdModel.needHandleEvent = true
                    dataArray.append(thirdModel)
                }
            }
        }
    
        tableView.bindingData(data: dataArray)
    }
    
    fileprivate lazy var tableView: MultiLevelTableView = {
        
        let view = MultiLevelTableView.init(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: UITableView.Style.plain)
        view.bgColor = UIColor.white
        view.eventDelegate = self
        return view
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: ThreeLevelListDelegate {
    func handleEvent(model: MultiLevelModel) {
        
    }
}

