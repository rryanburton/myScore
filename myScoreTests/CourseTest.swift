//
//  CourseTest.swift
//  myScore
//
//  Created by von Eitzen Frank on 29.07.14.
//  Copyright (c) 2014 Frank von Eitzen. All rights reserved.
//

import XCTest

class CourseTest: XCTestCase {
    
    var course:Course!

    override func setUp() {
        super.setUp()
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
        self.course = Course(name:"Testkurs", holes:holes)    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCourseAverage() {
        XCTAssert(course.average == 41, "Pass")
    }

}
