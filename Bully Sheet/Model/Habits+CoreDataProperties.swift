//
//  Habits+CoreDataProperties.swift
//  Bully Sheet
//
//  Created by Frantisek Varadzin on 24/01/2021.
//
//

import Foundation
import CoreData


extension Habits {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habits> {
        return NSFetchRequest<Habits>(entityName: "Habits")
    }

    @NSManaged public var date: Date?
    @NSManaged public var name: String?
    @NSManaged public var color: String?
 

}

extension Habits : Identifiable {

}
