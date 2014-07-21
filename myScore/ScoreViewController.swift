//
//  ViewController.swift
//  myScore
//
//  Created by Frank on 20.07.14.
//  Copyright (c) 2014 Frank von Eitzen. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
                            
    @IBOutlet var lblHits: UILabel
    @IBOutlet var lblPutts: UILabel
    @IBOutlet var lblPenalty: UILabel
    @IBOutlet var lblHole: UILabel
    @IBOutlet var lblPar: UILabel
    
    @IBOutlet var stepperHits: UIStepper
    @IBOutlet var stepperPutts: UIStepper
    @IBOutlet var stepperPenalties: UIStepper
    
    var hole: Hole?
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        //reset all stepper and lables to 0
        lblHits.text = "0"
        lblPutts.text = "0"
        lblPenalty.text = "0"
        
        lblHole.text = "Loch Nr. \(hole?.number)"
        lblPar.text = "Par: \(hole?.par) Länge: \(hole?.length)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateHits(sender: AnyObject) {
        
        lblHits.text = Int(stepperHits.value).description
        
    }

    @IBAction func updatePutts(sender: AnyObject) {
        
        var putts = Int(stepperPutts.value)
        var strokes = Int(stepperHits.value)
        
        lblPutts.text = Int(stepperPutts.value).description
        if (putts >= strokes) {
            strokes = ++putts
            stepperHits.value = Double(strokes)
            lblHits.text = Int(stepperHits.value).description
            
        }
    }
    
    @IBAction func updatePenalties(sender: AnyObject) {
        lblPenalty.text = Int(stepperPenalties.value).description
    }
}

