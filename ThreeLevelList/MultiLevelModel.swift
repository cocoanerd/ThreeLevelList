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
    
    /// 点击的是哪级
    public var currentLevel: LevelType = .frist
    
    public var fristIndex: Int = 0
    public var secondIndex: Int = 0
    public var thirdIndex: Int = 0
    
    /// section高度
    public var cellHeight: CGFloat = 0
    /// 是否展开
    public var isOpen: Bool = false
    
    public var isShow: Bool = false
    
    public var descript: String?
    
    public var imgSrc: String?
    
    public required override init(){ }
}


