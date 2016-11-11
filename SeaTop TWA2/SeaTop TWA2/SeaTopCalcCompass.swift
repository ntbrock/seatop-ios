//
//  SeaTopCalcCompass.swift
//  SeaTop TWA2
//
//  Created by Nathaniel Brockman on 1/18/15.
//  Copyright (c) 2015 Nathaniel Brockman. All rights reserved.
//

import Foundation


struct SeaTopCalcCompass
{
    static let off: [Int] = [ 12, 34, 57, 79, 102, 124, 147, 167, 192, 214, 237, 259, 282, 304, 327, 349, 360 ]
    
    static let lbl: [String] = [
        //0
        "N"  , "N" , "N" , "N" , "N" , "N" , "N" , "N" , "N" , "N" , "N" , "N"  ,
        //12
        "NNE","NNE","NNE","NNE","NNE","NNE","NNE","NNE","NNE","NNE","NNE",
        "NNE","NNE","NNE","NNE","NNE","NNE","NNE","NNE","NNE","NNE","NNE",
        //34
        "NE" ,"NE" ,"NE" ,"NE" ,"NE" ,"NE" ,"NE" ,"NE" ,"NE" ,"NE" ,"NE" ,
        "NE" ,"NE" ,"NE" ,"NE" ,"NE" ,"NE" ,"NE" ,"NE" ,"NE" ,"NE" ,"NE" ,
        // 57
        "ENE","ENE","ENE","ENE","ENE","ENE","ENE","ENE","ENE","ENE","ENE",
        "ENE","ENE","ENE","ENE","ENE","ENE","ENE","ENE","ENE","ENE","ENE",
        // 79
        "E"  ,"E"  ,"E"  ,"E"  ,"E"  ,"E"  ,"E"  ,"E"  ,"E"  ,"E"  ,"E"  ,
        "E"  ,"E"  ,"E"  ,"E"  ,"E"  ,"E"  ,"E"  ,"E"  ,"E"  ,"E"  ,"E"  ,
        // 102
        "ESE","ESE","ESE","ESE","ESE","ESE","ESE","ESE","ESE","ESE","ESE",
        "ESE","ESE","ESE","ESE","ESE","ESE","ESE","ESE","ESE","ESE","ESE",
        // 124
        "SE" ,"SE" ,"SE" ,"SE" ,"SE" ,"SE" ,"SE" ,"SE" ,"SE" ,"SE" ,"SE" ,
        "SE" ,"SE" ,"SE" ,"SE" ,"SE" ,"SE" ,"SE" ,"SE" ,"SE" ,"SE" ,"SE" ,
        // 147
        "SSE","SSE","SSE","SSE","SSE","SSE","SSE","SSE","SSE","SSE","SSE",
        "SSE","SSE","SSE","SSE","SSE","SSE","SSE","SSE","SSE","SSE","SSE",
        // 167
        "S"  ,"S"  ,"S"  ,"S"  ,"S"  ,"S"  ,"S"  ,"S"  ,"S"  ,"S"  ,"S"  ,
        "S"  ,"S"  ,"S"  ,"S"  ,"S"  ,"S"  ,"S"  ,"S"  ,"S"  ,"S"  ,"S"  ,
        // 192
        "SSW","SSW","SSW","SSW","SSW","SSW","SSW","SSW","SSW","SSW","SSW",
        "SSW","SSW","SSW","SSW","SSW","SSW","SSW","SSW","SSW","SSW","SSW",
        // 214
        "SW" ,"SW" ,"SW" ,"SW" ,"SW" ,"SW" ,"SW" ,"SW" ,"SW" ,"SW" ,"SW" ,
        "SW" ,"SW" ,"SW" ,"SW" ,"SW" ,"SW" ,"SW" ,"SW" ,"SW" ,"SW" ,"SW" ,
        
        // 237
        "WSW","WSW","WSW","WSW","WSW","WSW","WSW","WSW","WSW","WSW","WSW",
        "WSW","WSW","WSW","WSW","WSW","WSW","WSW","WSW","WSW","WSW","WSW",
        
        // 259
        "W"  ,"W"  ,"W"  ,"W"  ,"W"  ,"W"  ,"W"  ,"W"  ,"W"  ,"W"  ,"W"  ,
        "W"  ,"W"  ,"W"  ,"W"  ,"W"  ,"W"  ,"W"  ,"W"  ,"W"  ,"W"  ,"W"  ,
        
        // 282
        "WNW","WNW","WNW","WNW","WNW","WNW","WNW","WNW","WNW","WNW","WNW",
        "WNW","WNW","WNW","WNW","WNW","WNW","WNW","WNW","WNW","WNW","WNW",
        
        // 304
        "NW" ,"NW" ,"NW" ,"NW" ,"NW" ,"NW" ,"NW" ,"NW" ,"NW" ,"NW" ,"NW" ,
        "NW" ,"NW" ,"NW" ,"NW" ,"NW" ,"NW" ,"NW" ,"NW" ,"NW" ,"NW" ,"NW" ,
        
        // 327
        "NNW","NNW","NNW","NNW","NNW","NNW","NNW","NNW","NNW","NNW","NNW",
        "NNW","NNW","NNW","NNW","NNW","NNW","NNW","NNW","NNW","NNW","NNW",
        
        // 349
        "N"  , "N" , "N" , "N" , "N" , "N" , "N" , "N" , "N" , "N" , "N" ,
        "N"  , "N" , "N" , "N" , "N" , "N" , "N" , "N" , "N" , "N" , "N" ,
    ]
    
    
    // Integer based static lookup routine = fastest.
    static func compass(_ brg: Int) -> String {
        if ( brg < 0 || brg > 360 ) { return "ERR" }
        return lbl[brg]
    }
}
