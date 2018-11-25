//
//  RestaurantListTableViewController.swift
//  Q
//
//  Created by Jaeson Booker on 11/24/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import UIKit

class RestaurantListTableViewController: UITableViewController {
    var data: [Restaurant] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let r1 = Restaurant()
        let r2 = Restaurant()
        let r3 = Restaurant()
        
        r1.name = "Cooked Tender Loins"
        r1.restaurantDescription = "Get em' hot n' tender!"
        r1.restaurantImage = "tigers.jpg"
        r2.name = "SF Kale"
        r2.restaurantDescription = "Kale. Kale. Kale."
        r2.restaurantImage = "colorgradient.jpg"
        r3.name = "Bulba Fett Tea"
        r3.restaurantDescription = "Tea inspired by everyone's favourite Star Trek character"
        r3.restaurantImage = "tigers.jpg"
        
        data.append(r1)
        data.append(r2)
        data.append(r3)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantCell
        cell.restaurantName?.text = data[indexPath.row].name
        cell.restaurantDescription?.text = data[indexPath.row].restaurantDescription
        let rimage = UIImage.init(named: data[indexPath.row].restaurantImage)
        cell.restaurantImage.image = rimage
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
