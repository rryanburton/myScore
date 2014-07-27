//
//  CourseManager.swift
//  myScore
//
//  Created by Frank on 21.07.14.
//  Copyright (c) 2014 Frank von Eitzen. All rights reserved.
//

var manager = CourseManager()

struct CourseManager {
    
    func getCourseByName(name: String) -> Course {
        
        
        var holes = [
            Hole(number: 1, par: 3, length: 100, average:4),
            Hole(number: 2, par: 4, length: 250, average:5),
            Hole(number: 3, par: 3, length: 120, average:4),
            Hole(number: 4, par: 3, length: 130, average:8),
            Hole(number: 5, par: 4, length: 210, average:3),
            Hole(number: 6, par: 4, length: 240, average:4),
            Hole(number: 7, par: 4, length: 190, average:5),
            Hole(number: 8, par: 3, length: 120, average:4),
            Hole(number: 9, par: 3, length: 103, average:4)
        ]
        var current = Course(name: "Ebersberg Sepp Maier", holes: holes)
        
        return current
        
    }

}
