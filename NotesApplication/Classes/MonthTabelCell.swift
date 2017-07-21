//
//  MonthTabelCell.swift
//  NotesApplication
//
//  Created by Mohini Sindhu  on 20/07/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit

class MonthTabelCell: UITableViewCell
{
	@IBOutlet weak var monthName : UILabel!

    override func awakeFromNib()
	{
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
	{
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	public func setCellProperties(_ monthNameForNotes : String)
	{
			self.monthName.text = monthNameForNotes;
	
	}
}
