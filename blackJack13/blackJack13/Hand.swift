//
//  Hand.swift
//  blackJack13
//
//  Created by Kushal Jogi on 3/2/15.
//  Copyright (c) 2015 Kushal Jogi. All rights reserved.
//

import Foundation

class Hand {
    
    var cards:[Card]
    var bet:Int = 0
    var score:Int {
        get{
            var sum = 0
            for card in cards {
                sum += card.rank.values.first
            }
            if sum > 21 {
                for c in cards {
                    if c.rank.values.r == "A" {
                        sum -= c.rank.values.first
                        sum += c.rank.values.second!
                    }
                }
            }
            
            return sum
        }
    }
    
    init(){
        cards = []
    }
}