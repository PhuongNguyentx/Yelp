//
//  BusinessCell.swift
//  Yelp
//
//  Created by Phương Nguyễn on 10/18/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessCell: UITableViewCell {

    @IBOutlet weak var businessImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var reviewImage: UIImageView!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var reviewLabel: UILabel!
    var business: Business! {
        didSet{
            if business.imageURL != nil {
                businessImage.setImageWith(business.imageURL!)

            } else {
                businessImage.image = nil
            }
            nameLabel.text = business.name
            distanceLabel.text = business.distance
            reviewImage.setImageWith(business.ratingImageURL!)
            addressLabel.text = business.address
            categoryLabel.text = business.categories
            let countReview = Int(business.reviewCount!)
            reviewCountLabel.text = String(countReview)
            if countReview > 1 {
                reviewLabel.text = "Reviews"
            } else {
                reviewLabel.text = "Review"
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
