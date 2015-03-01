//
//  SeaTopCalcTWA.swift
//  SeaTop TWA2
//
//  Created by Nathaniel Brockman on 1/18/15.
//  Copyright (c) 2015 Nathaniel Brockman. All rights reserved.
//

import Foundation

struct SeaTopCalcTWA
{
    
    static func twa_(twd: Int, hdg: Int) -> (Int, Int, String) {
        var wa = twd - hdg
        var twa = 0
        var twas = 0
        var portStbd = ""
        
        if wa == 0 {
            portStbd = "--"
            twa = 0
            twas = 0
        } else if wa == 180 || wa == -180 {
            portStbd = "||"
            twa = 180
            twas = 180
        } else if wa > 0 && wa < 180 {
            portStbd = "|-"   // Inner Right Quadrant, STBD1
            twa = wa
            twas = twa
        } else if wa < 0 && wa > -180 {
            portStbd = "-|"   // Inner Left Quadrant, PORT1
            twa = -1 * wa
            twas = -1 * twa
        } else if wa < -180 {
            portStbd = "|-"   // Lower Left Quadrant, STBD2
            twa = 360 + wa
            twas = twa
        } else if wa > 180 {
            portStbd = "-|"   // Upper Right Quadrant, PORT2
            twa = 360 - wa
            twas = -1 * twa
        }
        
        return (twas, twa, portStbd)
    }
    
    
    /**
    * True wind angle, relative symbolic tuple
    * First element is an aolwqways positive window angle,
    * 2nd element is || for Astern,  -- for Ahead,  -| for Port  |- for Stbd
    */
    static func twa_r(twd: Int, hdg: Int) -> Int {
        return twa_(twd, hdg: hdg).0
    }
    
    
    /**
    * True wind angle, integer signed.  + is STBD, - is PORT
    */
    
    static func twa_s(twd: Int, hdg: Int) -> (Int, String) {
        
        var parts = twa_(twd, hdg: hdg)
        return (parts.1, parts.2)
    }
    
}
