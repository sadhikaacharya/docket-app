//
//  DockItem+CoreDataProperties.swift
//  Docket
//
//  Created by Sadhika Acharya on 6/27/22.
//
//

import Foundation
import CoreData

extension DockItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DockItem> {
        return NSFetchRequest<DockItem>(entityName: "DockItem")
    }

    @NSManaged public var itemName: String?
    @NSManaged public var completed: Bool
    @NSManaged public var priority: String?

}

extension DockItem : Identifiable {

}
