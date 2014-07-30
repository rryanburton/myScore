//
//  MatchTest.swift
//  myScore
//
//  Created by von Eitzen Frank on 24.07.14.
//  Copyright (c) 2014 Frank von Eitzen. All rights reserved.
//

import XCTest

class MatchTests: XCTestCase {
    

    var course: Course!
    
    
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
        self.course = Course(name:"Testkurs", holes:holes)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func initHolesWithAverageScore() {
        for hole in course.holes {
            hole.score.strokes = hole.average
        }
    }
    
    func testTotalScore() {
        
        let match = Match(course: self.course)
        
        // assign one stroke to each hole
        for hole in course.holes {
            hole.score.strokes = 1
        }
        // for 9 holes, this must be a total of 9
        XCTAssert(match.getTotalScore() == 9, "Pass")
        
        // assign 2 strokes to one hole
        match.course.holes[1].score.strokes = 2
        // so the total has to increase by 1
        XCTAssert(match.getTotalScore() == 10, "Pass")
        
        
    }
    
    func testTotalScoreInit() {
        
        // after initialization, the total score is 0
        let match = Match(course: self.course)
        XCTAssert(match.getTotalScore() == 0, "Pass")
    }
    
    func testCalculatedAverageNoScores() {
        
        let match = Match(course: self.course)
        XCTAssert(match.getCalculatedAverage() == 0, "Should be 0 but is \(match.getCalculatedAverage())")
        
    }
    
    func testCalculatedAverageScoreOnlyAverage() {
        
        initHolesWithAverageScore()
        let match = Match(course: self.course)
        
        XCTAssert(match.getCalculatedAverage() == 0, "Should be 0 but is \(match.getCalculatedAverage())")
        
    }
    
    func testCalculatedAverageScoreBetterThanAverage() {
        
        initHolesWithAverageScore()
        var currentHole = course.holes[3]
        currentHole.score.strokes = currentHole.average - 1
        let match = Match(course: self.course)
        
        XCTAssert(match.getCalculatedAverage() == -1, "Should be -1 but is \(match.getCalculatedAverage())")
        
    }
    
    func testCalculatedAverageScoreWorseThanAverage() {
        
        initHolesWithAverageScore()
        var currentHole = course.holes[3]
        currentHole.score.strokes = currentHole.average + 2
        let match = Match(course: self.course)
        
        XCTAssert(match.getCalculatedAverage() == 1, "Should be 1 but is \(match.getCalculatedAverage())")
        
    }
    
    func testCalculatedAverageScoreOverallAverage() {
        
        initHolesWithAverageScore()
        var badScore = course.holes[3]
        badScore.score.strokes = badScore.average + 2
        var goodScore1 = course.holes[4]
        goodScore1.score.strokes = goodScore1.average - 1
        var goodScore2 = course.holes[5]
        goodScore2.score.strokes = goodScore2.average - 1
        let match = Match(course: self.course)
        
        XCTAssert(match.getCalculatedAverage() == 0, "Should be 0 but is \(match.getCalculatedAverage())")
        
    }
    
    
}
