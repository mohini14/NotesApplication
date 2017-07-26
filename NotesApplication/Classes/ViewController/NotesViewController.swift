//
//  NotesViewController.swift
//  NotesApplication
//
//  Created by Mohini Sindhu  on 26/07/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit

class NotesViewController: UIViewController
{

	@IBOutlet weak var addNewNote : UIBarButtonItem!
	var monthName : String? = nil
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
    

   // MARK: InitialVC Methods
	func initialVCSetup()
	{
		title = self.monthName
	}
	
	
	//MARK: Actions on VC
	
	@IBAction func addNewNoteButtonPressed(_ sender : UIBarButtonItem)
	{
		self.addNewNote.isEnabled = false
		
		weak var weakSelf = self

		let subView = Bundle.main.loadNibNamed("AddNote", owner: nil, options: nil)?.first as! AddNote
		
		subView.frame = self.view.frame
		self.view.addSubview(subView)
		
		subView.onFetchingNote =
		{
			(notes : String) -> Void in
			
			if notes.isEmpty
			{
			Utils.promptMessageOnScreen("Please Enter Note", viewContoller: weakSelf!)
			}
		
			
			
		}
		
		
		
	}
	
}
