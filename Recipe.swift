//
//  Recipe.swift
//  recipez
//
//  Created by Dream Huang on 27/01/2016.
//  Copyright © 2016 Dream Huang. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Recipe: NSManagedObject {

    func setRecipeImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getRecipeImage() -> UIImage {
        if let data = self.image {
            let img = UIImage(data: data)!
            return img
        } else {
            return UIImage(named: "default")!
        }
        
    }

}
