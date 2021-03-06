// Playground - noun: a place where people can play

import UIKit

//----------------------------------------------------------------------
// Library Definition

/**
 * Internal True Wind Angle calculation function that reutrns all 3 elements
 */

func twa_(twd: Int, hdg: Int) -> (Int, Int, String) {
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
func twa_r(twd: Int, hdg: Int) -> Int {
    return twa_(twd, hdg).0
}


/**
 * True wind angle, integer signed.  + is STBD, - is PORT
 */

func twa_s(twd: Int, hdg: Int) -> (Int, String) {

    var parts = twa_(twd, hdg)
    return (parts.1, parts.2)
}


//---------------------------------------------------------------------------
// Main()

// Program INputs
var twd = 225
var hdg = 176

var hr = "-------------------------------"

var t = twa_r(twd, hdg)


