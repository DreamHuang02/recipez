//
//  addRecipeVC.swift
//  recipez
//
//  Created by Dream Huang on 27/01/2016.
//  Copyright © 2016 Dream Huang. All rights reserved.
//

import UIKit
import CoreData

class addRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        recipeImage.layer.cornerRadius = 4.0
        recipeImage.clipsToBounds = true
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImage.image = image
    }

    @IBAction func addImgBtnPressed(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addRecipeBtnPressed(sender: AnyObject) {
        if let title = recipeTitle.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            recipe.title = title
            recipe.ingredients = recipeIngredients.text
            recipe.steps = recipeSteps.text
            if let image = recipeImage.image {
                recipe.setRecipeImage(image)
            }
            do {
                try context.save()
            } catch let err as NSError {
                print(err.debugDescription)
            }
            self.navigationController!.popViewControllerAnimated(true)
        }
    }
    

}
