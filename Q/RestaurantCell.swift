//
//  RestaurantCell.swift
//  Q
//
//  Created by Jaeson Booker on 11/24/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {
    
    @IBOutlet var restaurantName: UILabel!
    @IBOutlet var restaurantDescription: UILabel!
    @IBOutlet var restaurantImage: UIImageView!
    @IBAction func addToFavourites(_ sender: Any) {
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
