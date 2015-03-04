//
//  Dealer.swift
//  blackJack13
//
//  Created by Kushal Jogi on 3/3/15.
//  Copyright (c) 2015 Kushal Jogi. All rights reserved.
//

import Foundation

class Dealer {
    
    var name:String
    var hands:Hand
    
    init(var dname: String,var dhands:Hand) {
        name = dname
        hands = dhands
        //      hands.append(Hand())
    }
    
}