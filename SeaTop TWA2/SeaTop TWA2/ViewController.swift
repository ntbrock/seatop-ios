//
//  ViewController.swift
//  SeaTop TWA2
//
//  Created by Nathaniel Brockman on 1/18/15.
//  Copyright (c) 2015 Nathaniel Brockman. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var twdM: UILabel!
    @IBOutlet weak var twdCompass: UILabel!
    @IBOutlet weak var twdSlider: UISlider!
    
    @IBOutlet weak var twdPlus: UIButton!
    @IBOutlet weak var twdMinus: UIButton!
    @IBOutlet weak var hdgPlus: UIButton!
    @IBOutlet weak var hdgMinus: UIButton!
    
    
    @IBOutlet weak var hdgM: UILabel!
    @IBOutlet weak var hdgCompass: UILabel!
    @IBOutlet weak var hdgSlider: UISlider!
    
    @IBOutlet weak var twaM: UILabel!
    @IBOutlet weak var twaStbd: UILabel!
    @IBOutlet weak var twaPort: UILabel!
    
    @IBOutlet weak var twaStbd2: UILabel!
    @IBOutlet weak var twaPort2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        onRecalc()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func twdLabel() {
        let twd = Int(twdSlider.value)
        twdM.text = NSString(format: "%03d", twd )
        twdCompass.text = NSString( UTF8String: SeaTopCalcCompass.compass(twd) )
    }

    func hdgLabel() {
        let hdg = Int(hdgSlider.value)
        hdgM.text = NSString(format: "%03d", hdg )
        hdgCompass.text = NSString( UTF8String: SeaTopCalcCompass.compass(hdg) )
    
    }
    
    @IBAction func onTwdChange(sender: AnyObject) {

//        let slider = sender as UISlider
//        let twd = Int(slider.value)
        twdLabel()
        onRecalc()
    }
    
    
    @IBAction func onHdgChange(sender: AnyObject) {
        hdgLabel()
        onRecalc()
    }

    
    
    
    @IBAction func onTwdPlus(sender: AnyObject) {
        
        let button = sender as UIButton
        twdSlider.value += 1
        onTwdChange(sender)
    }
    
    @IBAction func onTwdMinus(sender: AnyObject) {
        
        let button = sender as UIButton
        twdSlider.value -= 1
        onTwdChange(sender)
    }

    
    @IBAction func onHdgPlus(sender: AnyObject) {
        
        let button = sender as UIButton
        hdgSlider.value += 1
        onHdgChange(sender)
    }
    
    @IBAction func onHdgMinus(sender: AnyObject) {
        
        let button = sender as UIButton
        hdgSlider.value -= 1
        onHdgChange(sender)
    }
    
    
    
    
    func onRecalc( ) {
        let hdg = Int(hdgSlider.value)
        let twd = Int(twdSlider.value)
        
        // twaR is relativte, if negative then PORT
        let twaR = SeaTopCalcTWA.twa_r(twd, hdg: hdg)
        
        if ( twaR > 0 ) {
            twaStbd.alpha = 1
            twaStbd2.alpha = 1
            twaPort.alpha = 0.1
            twaPort2.alpha = 0.1
            twaM.text = NSString( format: "%d", twaR )
        } else if ( twaR < 0 ) {
            twaStbd.alpha = 0.1
            twaStbd2.alpha = 0.1
            twaPort.alpha = 1
            twaPort2.alpha = 1
            twaM.text = NSString( format: "%d", twaR * -1 )
        } else {
            twaStbd.alpha = 1
            twaStbd2.alpha = 1
            twaPort.alpha = 1
            twaPort2.alpha = 1
            twaM.text = NSString( format: "%d", twaR )
        }
        
        
        
    }
    

}

