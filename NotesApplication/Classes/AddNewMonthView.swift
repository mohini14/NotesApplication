//
//  AddNewMonthViewController.swift
//  NotesApplication
//
//  Created by Mohini Sindhu  on 21/07/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit

let  kAlphaColorForView  = CGFloat(0.3)

class AddNewMonthView: UIViewController
{
	//outlets
	@IBOutlet weak var monthTextField : UITextField!

	// public members
	var onFetchingMonthName: ((_ fetchedMonthName : String) -> Void)?
	var fetchedMonthName : String!

    override func viewDidLoad()
	{
        super.viewDidLoad()
		initialVCSetup()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
	{
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	func initialVCSetup()
	{
		self.view.backgroundColor = UIColor.black.withAlphaComponent(kAlphaColorForView)
	}
	
	//MARK: Actions on VC
	@IBAction func addNewMonthButtonPressed(_ sender: UIButton)
	{
		self.fetchedMonthName = self.monthTextField.text;
		
		if !self.fetchedMonthName.isEmpty
		{
			if let callBack = self.onFetchingMonthName
			{
				callBack(self.fetchedMonthName!);
			}
		}
		else
		{
			Utils.promptMessageOnScreen ("Please enter a month",viewContoller: self)
		}
	}
	
	@IBAction func cancelButtonPressed(_ sender: UIButton)
	{
		self.view.removeFromSuperview()

	}
}
