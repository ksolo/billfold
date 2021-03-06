//
//  foodController.swift
//  BillFold
//
//  Created by Michael Pourhadi on 7/5/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import Foundation

let sharedFoodController = foodController()

class foodController {
    
    var foodAndPrices:NSMutableArray = NSMutableArray()
    
    func calcTotals() {
        var totalForDiner = Double()
        var currentListOfDiners = sharedDinerController.dinerList
        
        // for loop for this bullshit
        for index in 0..currentListOfDiners.count {
            totalForDiner = 0.0
            var diner = sharedDinerController.dinerList[index]
            for foodItemPrice in diner.foodItems {
                var price = foodItemPrice.price as NSString
                var double = price.doubleValue
                var share = double/Double(foodItemPrice.counter)
                totalForDiner = totalForDiner + share
                sharedDinerController.dinerList[index].totalOwed = floor(totalForDiner*100)/100
            }
        }
    
    }

}