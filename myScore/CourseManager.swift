//
//  CourseManager.swift
//  myScore
//
//  Created by Frank on 21.07.14.
//  Copyright (c) 2014 Frank von Eitzen. All rights reserved.
//
import UIKit
import CoreData

var manager = CourseManager()

struct CourseManager {
    
    var context:NSManagedObjectContext!
    
    init() {
        var appDel = (UIApplication.sharedApplication().delegate as! AppDelegate)
        //self.context = appDel.managedObjectContext
    }
    
    func getCourseByName(name: String) -> Course {
        
        // Ebersberg Sepp Maier
        var holes = [
            Hole(number: 1, par: 3, length: 128, average:4),
            Hole(number: 2, par: 4, length: 237, average:5),
            Hole(number: 3, par: 3, length: 152, average:4),
            Hole(number: 4, par: 4, length: 329, average:8),
            Hole(number: 5, par: 3, length: 104, average:3),
            Hole(number: 6, par: 3, length: 165, average:4),
            Hole(number: 7, par: 4, length: 280, average:5),
            Hole(number: 8, par: 3, length: 113, average:4),
            Hole(number: 9, par: 3, length: 91, average:4)
        ]
        var current = Course(name: "Ebersberg Sepp Maier", holes: holes)
        
        return current
        
    }

}
