//
//  TableViewItem.swift
//  TableViewKit
//
//  Created by Nelson Dominguez Leon on 07/06/16.
//  Copyright © 2016 ODIGEO. All rights reserved.
//

import Foundation
import UIKit
import TableViewKit

public class CustomDrawer: CellDrawer {
    
    static public var cellType = CellType.Class(BaseCell.self)
    
    static public func draw(cell: BaseCell, withItem item: Any) {
        let item = item as! CustomItem
        cell.accessoryType = item.accessoryType
        cell.accessoryView = item.accessoryView
        cell.textLabel?.text = item.title
    }
}


public class CustomItem: Selectable, Item {
    
    public var title: String?
    
    public var onSelection: (Selectable) -> () = { _ in }
    
    public var cellStyle: UITableViewCellStyle = .Default
    public var accessoryType: UITableViewCellAccessoryType = .None
    public var accessoryView: UIView?
    public var cellHeight: CGFloat? = UITableViewAutomaticDimension
    
    public var drawer: CellDrawer.Type = CustomDrawer.self
    
    public init() { }
    
    public convenience init(title: String) {
        self.init()
        self.title = title
    }
}