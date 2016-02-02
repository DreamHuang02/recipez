//
//  detailRecipeVC.swift
//  recipez
//
//  Created by Dream Huang on 27/01/2016.
//  Copyright © 2016 Dream Huang. All rights reserved.
//

import UIKit
import CoreData

class detailRecipeVC: UIViewController {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeIngredients: UILabel!
    @IBOutlet weak var recipeSteps: UILabel!
    
    var recipes = [Recipe]()
    var row: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeIngredients.sizeToFit()
        recipeSteps.sizeToFit()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        fetchAndGetResults()
        let recipe = recipes[row]
        recipeTitle.text = recipe.title
        recipeIngredients.text = recipe.ingredients
        recipeSteps.text = recipe.steps
        recipeImage.image = recipe.getRecipeImage()
    }
    
    func fetchAndGetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Recipe")
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.recipes = results as! [Recipe]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }


}
