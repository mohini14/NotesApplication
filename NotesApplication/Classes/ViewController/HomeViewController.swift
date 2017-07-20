//
//  ViewController.swift
//  NotesApplication
//
//  Created by Mohini Sindhu  on 19/07/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit


class HomeViewController: UIViewController ,UITableViewDataSource
{
	@IBOutlet weak var monthTableView: UITableView!

	var months : [String] = ["January" , "Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

	// MARK:  View Life Cycle methods
	override func viewDidLoad()
	{
		super.viewDidLoad()
		initialVCSetup();
		
		// Do any additional setup after loading the view, typically from a nib.
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
	
		monthTableView.register(MonthTabelCell.self,
		                        forCellReuseIdentifier:Define.TableCellIdentifier.kMonthTableCell);
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

}

