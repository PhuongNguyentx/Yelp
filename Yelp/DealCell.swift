//
//  DealCell.swift
//  Yelp
//
//  Created by Phương Nguyễn on 10/23/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit

@objc protocol DealCellDelegate {
    @objc optional func dealCell(dealCell: DealCell, didChangeValue value: Bool)
}
class DealCell: UITableViewCell {

    @IBOutlet weak var SwitchDeal: UISwitch!
    
    var delegate: DealCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        SwitchDeal.isOn = false
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onSwitchDeal(_ sender: UISwitch) {
        delegate?.dealCell!(dealCell: self, didChangeValue: sender.isOn)
    }
}
