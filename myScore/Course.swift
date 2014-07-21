//
//  Course.swift
//  myScore
//
//  Created by Frank on 21.07.14.
//  Copyright (c) 2014 Frank von Eitzen. All rights reserved.
//

struct Course {
    
    var name:String
    var holes:[Hole]
    
    func getHoleByNumber(number:Int) -> Hole {
        return holes[number-1]
    }
    
    func getNumberOfHoles() -> Int {
        return holes.count
    }
    
}
