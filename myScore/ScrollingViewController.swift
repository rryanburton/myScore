//
//  ScrollingViewController.swift
//  myScore
//
//  Created by Frank on 10.08.14.
//  Copyright (c) 2014 Frank von Eitzen. All rights reserved.
//

import UIKit

class ScrollingViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    let match = Match(course: manager.getCourseByName("Ebersberg"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.contentSize = CGSizeMake(1000,1000)
        
        var currentController = self.storyboard.instantiateViewControllerWithIdentifier("scoreViewController") as ScoreViewController
        self.addChildViewController(currentController)
        currentController.didMoveToParentViewController(self)
        currentController.hole = match.course.getHoleByNumber(1)
        currentController.match = match
        self.scrollView.addSubview(currentController.view)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        println("scrollViewDidScroll")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
