//
//  SortCell.swift
//  Yelp
//
//  Created by Phương Nguyễn on 10/23/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit

@objc protocol SortCellDelegate {
    @objc optional func sortCellDidSwitchChanged(sortCell: SortCell,didChangeValue value: Bool)
}
class SortCell: UITableViewCell {
 
    @IBOutlet weak var onSwitchSort: UISwitch!
    weak var delegate: SortCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        onSwitchSort.isOn = false
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    @IBAction func onSwitchSortChange(_ sender: UISwitch) {
        delegate?.sortCellDidSwitchChanged?(sortCell: self, didChangeValue: sender.isOn)
    }

}
