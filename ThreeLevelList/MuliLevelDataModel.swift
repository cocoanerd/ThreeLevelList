//
//  MuliLevelDataModel.swift
//  Pods-ThreeLevelList_Example
//
//  Created by mmh on 2020/3/27.
//

import UIKit

public class MuliLevelDataModel: NSObject {
    
    /// 一级数据
    public var firstLevelData: [MultiLevelModel]?
    
    /// 二级数据
    public var secondLevelData: [String: Any]?
    
    /// 三级数据
    public var thirdLevelData: [String: Any]?
    
    /// 总数据
    public var totalData: [MultiLevelModel]?
    
    public required override init(){ }
}
