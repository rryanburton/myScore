//
//  Hole.swift
//  myScore
//
//  Created by Frank on 21.07.14.
//  Copyright (c) 2014 Frank von Eitzen. All rights reserved.
//

class Hole {
    
    var number:Int
    var par:Int
    var length:Int
    
    var score = Score()
    
    init() {
        self.number = 0
        self.par = 0
        self.length = 0
    }
    
    init(number:Int, par:Int, length:Int) {
        self.number = number
        self.par = par
        self.length = length
    }
    
}
