//
//  RecipeCell.swift
//  recipez
//
//  Created by Dream Huang on 27/01/2016.
//  Copyright © 2016 Dream Huang. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(recipe: Recipe) {
        recipeImage.image = recipe.getRecipeImage()
        recipeTitle.text = recipe.title
    }

}
