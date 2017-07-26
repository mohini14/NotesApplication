//
//  CoreData.swift
//  NotesApplication
//
//  Created by Mohini Sindhu  on 26/07/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit
import CoreData

class CoreData: NSObject
{
	static var managedContext : NSManagedObjectContext? = nil
	
	class func getManagedObjectContext()
	{
		//1
		guard let appDelegate =
			UIApplication.shared.delegate as? AppDelegate else
		{
				return
		}
		
		 managedContext =
			appDelegate.persistentContainer.viewContext
	 }
	
	// save function to save an entity details to persistance
	class func save(enityName : String ,forAttributeValue attributeValue:String, forAttributeKeyName keyName: String)
	{
		CoreData.getManagedObjectContext()

		// getting entity refrence
		let entity =
			NSEntityDescription.entity(forEntityName:enityName,
			                           in: managedContext!)!
		
		let newMonth = NSManagedObject(entity: entity,
		                               insertInto: managedContext)
		
		
		// setting value of attribute in Entity
		newMonth.setValue(attributeValue, forKeyPath:keyName)
		
		
		// using try catch while saving
		do
		{
			try managedContext?.save()
		}
		catch let error as NSError
		{
			print("Could not save. \(error), \(error.userInfo)")
		}
	}
	
	
	// to fetch 'Month' Entity Data
	class func fetchMonthData(attributeKey:String) -> Array<String>?
	{
		CoreData.getManagedObjectContext()

		var array = Array<String>()

		let fetchRequest = NSFetchRequest<Month>(entityName: "Month")
		
		do
		{
			let fetchedResults = try managedContext!.fetch(fetchRequest)
			for item in fetchedResults
			{
				array.append(item.value(forKey:attributeKey)! as! String)
			}
			
			return array
		} catch let error as NSError
		{
			// something went wrong, print the error.
			print(error.description)
		}
		return nil
	}
	
}
