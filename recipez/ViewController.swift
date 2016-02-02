//
//  ViewController.swift
//  recipez
//
//  Created by Dream Huang on 27/01/2016.
//  Copyright © 2016 Dream Huang. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var recipes = [Recipe]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndGetResults()
        tableView.reloadData()
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell") as? RecipeCell {
            cell.configureCell(recipes[indexPath.row])
            return cell
        } else {
            let cell = RecipeCell()
            cell.configureCell(recipes[indexPath.row])
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        let row = indexPath.row
        
        let segue = UIStoryboardSegue(identifier: "goToDetailRecipeVC", source: self, destination: detailRecipeVC())
        
        prepareForSegue(segue, sender: row)
        return indexPath
    }
    
    
//    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        let theRecipe = "It works!"
//        print("\(indexPath.row) is selected")
//        performSegueWithIdentifier("goToDetailRecipeVC", sender: theRecipe)
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToDetailRecipeVC" {
            if let detailVC = segue.destinationViewController as? detailRecipeVC {
                if let row = sender as? Int {
                    detailVC.row = row
                }
            }
        }
    }
    


}

