//
//  Utils.swift
//  NotesApplication
//
//  Created by Mohini Sindhu  on 21/07/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit

class Utils: NSObject
{

	class func promptMessageOnScreen (_ message : String, viewContoller: UIViewController) -> ()
	{
	
		let alert = UIAlertController(title: NSLocalizedString("ALert", comment: "") ,message: message , preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler:nil))
		viewContoller.present(alert, animated:true, completion:nil)
	}
}

