//
//  Person.swift
//  SwiftUIPractice
//
//  Created by Raihan on 13/7/24.
//

import Foundation
import SwiftData
import UIKit

@Model
class Person {
    
    var customerName: String
    var mobileNumber: String
    var orderAmount: String
    var deliveryCharge: String
    var cakeDetails: String
    var cakeName: String
    var orderDate: Date
    var customerLocation: String
    
    init(customerName: String, mobileNumber: String, orderAmount: String, deliveryCharge: String, cakeDetails: String, cakeName: String, orderDate: Date,customerLocation: String) {
        self.customerName = customerName
        self.mobileNumber = mobileNumber
        self.orderAmount = orderAmount
        self.deliveryCharge = deliveryCharge
        self.cakeDetails = cakeDetails
        self.orderDate = orderDate
        self.customerLocation = customerLocation
        self.cakeName = cakeName
    }
}
