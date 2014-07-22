//
//  ViewController.swift
//  myScore
//
//  Created by Frank on 20.07.14.
//  Copyright (c) 2014 Frank von Eitzen. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
                            
    @IBOutlet weak var lblHits: UILabel!
    @IBOutlet weak var lblPutts: UILabel!
    @IBOutlet weak var lblPenalty: UILabel!
    @IBOutlet weak var lblHole: UILabel!
    @IBOutlet weak var lblPar: UILabel!
    
    @IBOutlet weak var stepperHits: UIStepper!
    @IBOutlet weak var stepperPutts: UIStepper!
    @IBOutlet weak var stepperPenalties: UIStepper!
    
    var hole = Hole()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        //reset all stepper and lables to 0
        lblHits.text = "\(hole.score.strokes)"
        lblPutts.text = "\(hole.score.putts)"
        lblPenalty.text = "\(hole.score.penalties)"
        
        lblHole.text = "Loch Nr. \(hole.number)"
        lblPar.text = "Par: \(hole.par) Länge: \(hole.length)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateHits(sender: AnyObject) {
        
        hole.score.strokes = Int(stepperHits.value)
        lblHits.text = hole.score.strokes.description
        
    }

    @IBAction func updatePutts(sender: AnyObject) {
        
        hole.score.putts = Int(stepperPutts.value)
        lblPutts.text = hole.score.putts.description
    }
    
    @IBAction func updatePenalties(sender: AnyObject) {
        
        hole.score.penalties = Int(stepperPenalties.value)
        lblPenalty.text = hole.score.penalties.description
        
    }
}

