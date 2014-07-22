//
//  ScorePageViewController.swift
//  myScore
//
//  Created by Frank on 20.07.14.
//  Copyright (c) 2014 Frank von Eitzen. All rights reserved.
//

import UIKit

class ScorePageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    let course = manager.getCourseByName("Ebersberg")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.dataSource = self
        
        var viewControllers = [viewControllerAtIndex(1)] as NSArray
        setViewControllers(viewControllers, direction: .Forward, animated: false, completion: nil)

        
    }
    
    func pageViewController(pageViewController: UIPageViewController!, viewControllerBeforeViewController viewController: UIViewController!) -> UIViewController! {
        
        var before = viewController as ScoreViewController
        var currentController: ScoreViewController?
        if (before.hole.number > 1) {
            var current = before.hole.number - 1
            currentController = viewControllerAtIndex(current)
        }
        return currentController
        
    }
    
    func pageViewController(pageViewController: UIPageViewController!, viewControllerAfterViewController viewController: UIViewController!) -> UIViewController! {
        
        var after = viewController as ScoreViewController
        var currentController: ScoreViewController?
        if (after.hole.number < course.getNumberOfHoles()) {
            var current = after.hole.number + 1
            currentController = viewControllerAtIndex(current)
        }
        return currentController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController!) -> Int {
       return course.getNumberOfHoles()
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController!) -> Int {
        var currentController = pageViewController.viewControllers[0] as ScoreViewController
        return currentController.hole.number - 1
    }
    
    func viewControllerAtIndex(index: Int) -> ScoreViewController {
        
        var currentController = self.storyboard.instantiateViewControllerWithIdentifier("scoreViewController") as ScoreViewController
        currentController.hole = course.getHoleByNumber(index)
        return currentController
        
    }
    
    func updateScores(controller: ScoreViewController) {
        
        println(controller.hole.score.strokes)
        
    }
    
}
