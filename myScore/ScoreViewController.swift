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
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblLength: UILabel!
    @IBOutlet weak var lblPar: UILabel!
    
    @IBOutlet weak var stepperHits: UIStepper!
    @IBOutlet weak var stepperPutts: UIStepper!
    @IBOutlet weak var stepperPenalties: UIStepper!
    
    @IBOutlet weak var imgAverage: UIImageView!
    @IBOutlet weak var imgTotalAverage: UIImageView!
    
    var hole: Hole!
    var match: Match!
    
    var imgArrowUp = UIImage(named: "Arrow_Up")
    var imgArrowDown = UIImage(named: "Arrow_Down")
    var imgArrowSame = UIImage(named: "Arrow_Same")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
   
        lblHits.text = "\(hole.score.strokes)"
        lblPutts.text = "\(hole.score.putts)"
        lblPenalty.text = "\(hole.score.penalties)"
        
        stepperHits.value = Double(hole.score.strokes)
        stepperPutts.value = Double(hole.score.putts)
        stepperPenalties.value = Double(hole.score.penalties)
        
        lblHole.text = "Nr. \(hole.number)"
        lblPar.text = "Par: \(hole.par)"
        lblLength.text = "Len: \(hole.length)"
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateScore()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTotalScore() {
        lblTotal.text = "Ges: \(match.getTotalScore())"
    }
    
    func updateHitsColor() {
        if hole.score.strokes <= hole.par {
            lblHits.textColor = UIColor.greenColor()
        }
        else {
            lblHits.textColor = UIColor.blackColor()
        }
    }
    
    func updateScore() {
        
        stepperHits.value = Double(hole.score.strokes)
        stepperPutts.value = Double(hole.score.putts)
        stepperPenalties.value = Double(hole.score.penalties)
        
        lblHits.text = hole.score.strokes.description
        lblPutts.text = hole.score.putts.description
        lblPenalty.text = hole.score.penalties.description
        
        //imgAverage.hidden = !(hole.score.strokes > hole.average)
        switch (hole.score.strokes - hole.average) {
        case -100...(-1):
            imgAverage.image = imgArrowUp
        case 1...100:
            imgAverage.image = imgArrowDown
        default:
            imgAverage.image = imgArrowSame
        }
        
        switch match.getCalculatedAverage() {
        case -1:
            imgTotalAverage.image = imgArrowUp
        case 1:
            imgTotalAverage.image = imgArrowDown
        default:
            imgTotalAverage.image = imgArrowSame
        }
        
        
        updateHitsColor()
        updateTotalScore()
        
    }

    @IBAction func updateHits(sender: AnyObject) {
        
        hole.score.strokes = Int(stepperHits.value)
        updateScore()

        
    }

    @IBAction func updatePutts(sender: AnyObject) {
        
        hole.score.putts = Int(stepperPutts.value)
        updateScore()
        
    }
    
    @IBAction func updatePenalties(sender: AnyObject) {
        
        hole.score.penalties = Int(stepperPenalties.value)
        updateScore()
        
    }
}

