//
//  AddNewMonth.swift
//  NotesApplication
//
//  Created by Mohini Sindhu  on 25/07/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit

let kAlphaValueForView = CGFloat(0.5)
class AddNewMonth: UIView
{

	//outlets
	@IBOutlet weak var monthTextField : UITextField!
	
	// public members
	var onFetchingMonthName: ((_ fetchedMonthName : String) -> Void)?
	
	override func draw(_ rect: CGRect)
	{
		super.draw(rect)
		initialVCSetup()
	}
	
	func initialVCSetup()
	{
		self.backgroundColor = UIColor.black.withAlphaComponent(kAlphaValueForView)
	}
	
	//MARK: Actions on VC
	@IBAction func submitButtonPressed(_ sender: UIButton)
	{
		
		if let callBack = self.onFetchingMonthName
		{
			callBack(self.monthTextField.text!);
		}
	}
	
	@IBAction func cancelButtonPressed(_ sender: UIButton)
	{
		self.removeFromSuperview()
	}
	
	@IBAction func dissmissSubViews()
	{
		self.endEditing(true)
	}
}
