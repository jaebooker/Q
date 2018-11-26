//
//  restaurant.swift
//  Q
//
//  Created by Jaeson Booker on 11/24/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class  Restaurant: NSObject, MKAnnotation {
    public var name: String = ""
    public var restaurantDescription: String = ""
    public var restaurantImage: String = ""
    public var favourite: Bool = false
    public var latitude: Double = 37.780664
    public var longitude: Double = 122.416183
    public var coordinate: CLLocationCoordinate2D=CLLocationCoordinate2D(latitude: 37.780664, longitude: -122.416183)
}
