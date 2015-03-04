//
//  Player.swift
//  blackJack13
//
//  Created by Kushal Jogi on 3/2/15.
//  Copyright (c) 2015 Kushal Jogi. All rights reserved.
//

import Foundation

class Player {
    
    var name:String
    var money:Int = 100
    var hands:Hand
    
    init(var pname:String,var pmoney:Int,var phands:Hand) {
        name = pname
        money = pmoney
        hands = phands
  //      hands.append(Hand())
    }
    
}