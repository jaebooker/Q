//
//  MenuViewController.swift
//  Q
//
//  Created by Jaeson Booker on 11/24/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var restaurantsOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func restaurantsAction(_ sender: Any) {
        NSLog("Captain's Log: We have now entered the Button action")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
