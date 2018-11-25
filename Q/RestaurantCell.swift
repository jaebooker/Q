//
//  RestaurantCell.swift
//  Q
//
//  Created by Jaeson Booker on 11/24/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {
    var newRestaurant: Restaurant!
    @IBOutlet var restaurantName: UILabel!
    @IBOutlet var restaurantDescription: UILabel!
    @IBOutlet var restaurantImage: UIImageView!
    @IBAction func addToFavourites(_ sender: Any) {
        let button = sender as! UIButton
        if newRestaurant.favourite == false {
            newRestaurant.favourite = true
        } else {
            newRestaurant.favourite = false
        }
    }
    func createRestaurant(nRestaurant: Restaurant) {
        newRestaurant = nRestaurant
        restaurantName?.text = newRestaurant .name
        restaurantDescription?.text = newRestaurant .restaurantDescription
        let rimage = UIImage.init(named: newRestaurant .restaurantImage)
        restaurantImage.image = rimage
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
