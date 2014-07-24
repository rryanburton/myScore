//
//  Match.swift
//  myScore
//
//  Created by von Eitzen Frank on 24.07.14.
//  Copyright (c) 2014 Frank von Eitzen. All rights reserved.
//

class Match {
    
    var course: Course
    
    init(course:Course) {
        self.course = course
    }
    
    func getTotalScore() -> Int {
        
        var total = 0
        for hole in course.holes {
            total = total + hole.score.strokes
        }
        return total
    }
    
}
