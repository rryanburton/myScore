//
//  ScorePageViewController.swift
//  myScore
//
//  Created by Frank on 20.07.14.
//  Copyright (c) 2014 Frank von Eitzen. All rights reserved.
//

import UIKit

class ScorePageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    let MIN = 1
    let MAX = 9
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.dataSource = self
        
        var viewControllers = [viewControllerAtIndex(MIN)] as NSArray
        setViewControllers(viewControllers, direction: .Forward, animated: false, completion: nil)

        
    }
    
    func pageViewController(pageViewController: UIPageViewController!, viewControllerBeforeViewController viewController: UIViewController!) -> UIViewController! {
        
        var before = viewController as ScoreViewController
        var currentController: ScoreViewController?
        if (before.hole > MIN) {
            var current = before.hole! - 1
            currentController = viewControllerAtIndex(current)
        }
        return currentController
        
    }
    
    func pageViewController(pageViewController: UIPageViewController!, viewControllerAfterViewController viewController: UIViewController!) -> UIViewController! {
        
        var after = viewController as ScoreViewController
        var currentController: ScoreViewController?
        if (after.hole < MAX) {
            var current = after.hole! + 1
            currentController = viewControllerAtIndex(current)
        }
        return currentController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController!) -> Int {
       return MAX
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController!) -> Int {
        var currentController = pageViewController.viewControllers[0] as ScoreViewController
        return currentController.hole! - 1
    }
    
    func viewControllerAtIndex(index: Int) -> ScoreViewController {
        
        var currentController = self.storyboard.instantiateViewControllerWithIdentifier("scoreViewController") as ScoreViewController
        currentController.hole = index
        
        return currentController
        
    }
    
}
