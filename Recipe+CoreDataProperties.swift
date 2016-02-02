//
//  Recipe+CoreDataProperties.swift
//  recipez
//
//  Created by Dream Huang on 27/01/2016.
//  Copyright © 2016 Dream Huang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Recipe {

    @NSManaged var title: String?
    @NSManaged var ingredients: String?
    @NSManaged var steps: String?
    @NSManaged var image: NSData?

}
