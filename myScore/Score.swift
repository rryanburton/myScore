//
//  Score.swift
//  myScore
//
//  Created by von Eitzen Frank on 22.07.14.
//  Copyright (c) 2014 Frank von Eitzen. All rights reserved.
//

struct Score {
    
    // Initialize score with 0
    
    var strokes:Int = 0
    
    var putts:Int = 0 {
    willSet {
        if newValue >= strokes {
            strokes = newValue + 1
        }
        if newValue >= (strokes + penalties) {
            strokes = (newValue + penalties) + 1
        }
    }
    }
    
    var penalties:Int = 0 {
    willSet {
        if newValue >= strokes {
            strokes = newValue + 1
        }
    }
    }

    
}
