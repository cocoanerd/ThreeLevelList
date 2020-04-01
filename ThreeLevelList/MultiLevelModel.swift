//
//  MultiLevelModel.swift
//  ThreeLevelList
//
//  Created by mmh on 2020/3/27.
//

import UIKit

public class MultiLevelModel: NSObject {
    
    public enum LevelType: Int {
        case frist
        case second
        case third
    }
    
    /// 点击的是几级目录
    public var currentLevel: LevelType = .frist
    
    /// 记录model的索引
    public var fristIndex: Int = 0
    public var secondIndex: Int = 0
    public var thirdIndex: Int = 0
    
    /// section高度
    public var cellHeight: CGFloat = 50
    
    /// 是否展开
    public var isOpen: Bool = false
    
    /// 是否显示
    public var isShow: Bool = false
    
    /// 是否需要处理点击事件
    public var needHandleEvent: Bool = false
    
    /// 文字描述
    public var descript: String?
    
    /// 图片
    public var imgSrc: String?
    
    public required override init(){ }
}


