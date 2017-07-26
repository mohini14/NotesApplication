//
//  AddNote.swift
//  NotesApplication
//
//  Created by Mohini Sindhu  on 26/07/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit

class AddNote: UIView
{
	@IBOutlet weak var noteTextView : UITextView!
	var onFetchingNote : ((_ notes : String) -> Void)?

	
    override func draw(_ rect: CGRect)
	{
		super.draw(rect)
		initialVCSetup()
    }
	
	func initialVCSetup()
	{
		self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
	}
	
	@IBAction func submitButtonPressed(_ sender : UIButton)
	{
		if let callBack = self.onFetchingNote
		{
			callBack(self.noteTextView.text);
		}
	}
	
	@IBAction func cancelActionPerformed()
	{
		self.removeFromSuperview()
	}
	
	@IBAction func dissmisPopUpView()
	{
		self.endEditing(true)
	}

}
