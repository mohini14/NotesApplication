//
//  ViewController.swift
//  NotesApplication
//
//  Created by Mohini Sindhu  on 19/07/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit


class HomeViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate
{
	@IBOutlet weak var monthTableView: UITableView!
	@IBOutlet weak var addNewMonthButton : UIBarButtonItem!
	
//	var monthName : String? = nil

	var months = Array<String>()
	
	// MARK:  View Life Cycle methods
	override func viewDidLoad()
	{
		super.viewDidLoad()
		initialVCSetup();
		
		// Do any additional setu after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning()
	{
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: Initial VC methods
	func initialVCSetup()
	{
		title = NSLocalizedString("Month List", comment: "")
	
		// register table cell NIB
		monthTableView.register(UINib(nibName: Define.TableCellXIBNmae.kMonthTableCellXIBName, bundle:Bundle.main) , forCellReuseIdentifier: Define.TableCellIdentifier.kMonthTableCell)
		
		populateTableView()
	}
	
	func populateTableView()
	{
		months = CoreData.fetchMonthData(attributeKey: "monthName")!
		
		self.monthTableView.reloadData()
	}
	
	
	// MARK: TAble View Data Source methods
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return months.count;
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		let cell  = tableView.dequeueReusableCell(withIdentifier: Define.TableCellIdentifier.kMonthTableCell, for:indexPath) as! MonthTabelCell
		
		cell.setCellProperties (months[indexPath.row])
		return cell
	}

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
	{
	   self.performSegue(withIdentifier: Define.SegueIdentifiers.kHomeToNOtesVC , sender: indexPath)
	}
	
	// MARK: Actions on VC
	@IBAction func addNewMonthButtonPressed(_ sender: UIBarButtonItem)
    {
		self.addNewMonthButton.isEnabled = false
		
		weak var weakSelf = self
		
		let subVC = Bundle.main.loadNibNamed("AddNewMonth", owner: AddNewMonth() , options: nil)?.first as! AddNewMonth
		
		subVC.frame = self.view.frame
		self.view.addSubview(subVC)
		
		subVC.onFetchingMonthName =
		{
			(monthName : String) -> Void in
			
			weakSelf?.addNewMonthButton.isEnabled = true

			if monthName.isEmpty
			{
				Utils.promptMessageOnScreen("Please Enter a valid month", viewContoller: weakSelf!)
			}
			else
			{
				subVC.removeFromSuperview()
				CoreData.save(enityName: "Month", forAttributeValue: monthName, forAttributeKeyName: "monthName")
				weakSelf?.populateTableView()
				
			}
		}
	}
	
	
	// MARK: navigation methods
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?)
	{
		let indexPath : IndexPath = sender as! IndexPath
		if segue.identifier == Define.SegueIdentifiers.kHomeToNOtesVC
		{
			let destVC : NotesViewController = segue.destination as! NotesViewController
			destVC.monthName = self.months[indexPath.row]
		}
	}
}

