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

    @NSManaged public var datum: String?
    @NSManaged public var fifth_habit: String?
    @NSManaged public var first_habit: String?
    @NSManaged public var fourth_habit: String?
    @NSManaged public var second_habit: String?
    @NSManaged public var state1: String?
    @NSManaged public var state2: String?
    @NSManaged public var state3: String?
    @NSManaged public var state4: String?
    @NSManaged public var state5: String?
    @NSManaged public var third_habit: String?

}

extension Habits : Identifiable {

}
