//
//  SeaTopCoraCourses.swift
//  SeaTop CORA 2015
//
//  Created by Nathaniel Brockman on 1/25/15.
//  Copyright (c) 2015 Nathaniel Brockman. All rights reserved.
//

import Foundation

// Playground - noun: a place where people can play

import UIKit


var schedule = []

// Check in - VHF 74
// Announcements - VHF 73



// 7.3 Class flags:
//  Class A-Pink,
//  Class B Green
//  Class C Yellow,
//  Class D Lt Blue
//  Class N Purple
//  Class S White.

struct CoraClassFlag {
    let letter: String
    let color: String
}

let classFlags = [
    "A": CoraClassFlag( letter: "A", color: "Pink" ),
    "B": CoraClassFlag( letter: "B", color: "Green" ),
    "C": CoraClassFlag( letter: "C", color: "Yellow" ),
    "D": CoraClassFlag( letter: "D", color: "Lt Blue" ),
    "N": CoraClassFlag( letter: "N", color: "Purple" ),
    "S": CoraClassFlag( letter: "S", color: "White" )
]


struct CoraCourse {
    let title: String
    let distanceNm: Double
    let category: String  // Offshore, Harbor
    let marks:[CoraRounding]
}


struct CoraRounding {
    let mark: CoraMark
    let leaveTo: String
    let nextLeg: CoraLeg
    
    
    static let NONE = ""
    
    static let port = "PORT"
    static let STBD = "STBD"
    static let p = "PORT"
    static let S = "STBD"
    
}


struct CoraMark {
    let name: String
    let desc: String
    let lat: String
    let long: String
    
    static let NONE   = CoraMark(name: "NONE",    desc: "No Mark"                   ,  lat: "",  long: "")
    
    // Harbor Marks
    static let START  = CoraMark(name: "START",  desc: "Starting mark and CYC dock" ,  lat: "32°46.559'N",  long: "79°55.323'W")
    static let FINISH = CoraMark(name: "FINISH", desc: "Finishing mark and CYC dock",  lat: "32°46.559'N",  long: "79°55.323'W")
    static let J      = CoraMark(name: "J",      desc: "\"J\" Mark"                 ,  lat: "32°46.559'N",  long: "79°55.064'W")
    static let BP     = CoraMark(name: "BP",     desc: "RG \"BP\" Fl (2+1) R 6s"    ,  lat: "32°45.622'N",  long: "79°55.078'W")
    static let R4     = CoraMark(name: "R4",     desc: "R \"4\" Fl R 4s"            ,  lat: "32°45.840'N",  long: "79°54.952'W")
    static let R2     = CoraMark(name: "R2",     desc: "R \"2\" Fl R 2.5s"          ,  lat: "32°45.567'N",  long: "79°52.920'W")
    static let G27    = CoraMark(name: "G27",    desc: "G \"27\" Fl G 2.5s PORT"    ,  lat: "32°46.284'N",  long: "79°53.312'W")
    static let G37    = CoraMark(name: "G37",    desc: "G \"37\" Fl G 4s PORT"      ,  lat: "32°47.621'N",  long: "79°55.107'W")
    
    // JETI - A made up location by Taylor that gives clear out to all destination routing marks and maximizes channel
    static let JETI   = CoraMark(name: "jeti",   desc: "Jetties Inner Clearing Mark",  lat: "32°45.450'N",  long: "79°52.688'W")
    
    // Offshore Marks
    static let G15    = CoraMark(name: "G15",    desc: "G \"15\" Fl G 4s"           ,  lat: "32°42.757'N",  long: "79°47.598'W")
    static let G13    = CoraMark(name: "G13",    desc: "G \"13\" Fl G 2.5s"         ,  lat: "32°41.964'N",  long: "79°45.940'W")
    static let R14    = CoraMark(name: "R14",    desc: "R \"14\" Fl R 2.5s BELL"    ,  lat: "32°42.137'N",  long: "79°45.832'W")
    
    static let RN2    = CoraMark(name: "RN2",    desc: "RN \"2\" (Rattlesnake)"     ,  lat: "32°44.432'N",  long: "79°43.090'W")
    static let RWC    = CoraMark(name: "RW C",   desc: "RW \"C\" Mo (A) WHIS"       ,  lat: "32°37.073'N",  long: "79°35.486'W")
}


// Accelerators for Angles and Distances
struct CoraLeg {
    
    let begin: CoraMark
    let end: CoraMark
    let headingToNextM: Int
    let distanceToNextNm: Double
    
    static let NONE         = CoraLeg ( begin: CoraMark.NONE , end: CoraMark.NONE  , headingToNextM: -1, distanceToNextNm: 0 )
    
    static let START_TO_BP  = CoraLeg ( begin: CoraMark.START, end: CoraMark.BP    , headingToNextM: 175, distanceToNextNm: 0.97 )
    static let START_TO_J   = CoraLeg ( begin: CoraMark.START, end: CoraMark.J     , headingToNextM: 064, distanceToNextNm: 0.24 )
    static let START_TO_R4  = CoraLeg ( begin: CoraMark.START, end: CoraMark.R4    , headingToNextM: 164, distanceToNextNm: 0.78 )
    static let START_TO_G37 = CoraLeg ( begin: CoraMark.START, end: CoraMark.G37   , headingToNextM: 017, distanceToNextNm: 1.08 )
    static let START_TO_R2  = CoraLeg ( begin: CoraMark.START, end: CoraMark.R2    , headingToNextM: 124, distanceToNextNm: 2.3 )
    
    static let BP_TO_R2     = CoraLeg ( begin: CoraMark.BP   , end: CoraMark.R2    , headingToNextM: 099, distanceToNextNm: 1.82 )
    static let BP_TO_J      = CoraLeg ( begin: CoraMark.BP   , end: CoraMark.J     , headingToNextM: 009, distanceToNextNm: 1.0 )
    static let BP_TO_G27    = CoraLeg ( begin: CoraMark.BP   , end: CoraMark.G27   , headingToNextM: 073, distanceToNextNm: 1.64 )
    static let BP_TO_G37    = CoraLeg ( begin: CoraMark.BP   , end: CoraMark.G37   , headingToNextM: 007, distanceToNextNm: 2.0 )
    static let BP_TO_FINISH = CoraLeg ( begin: CoraMark.BP   , end: CoraMark.FINISH, headingToNextM: 355, distanceToNextNm: 0.97 )
    
    static let J_TO_R4      = CoraLeg ( begin: CoraMark.J    , end: CoraMark.R4    , headingToNextM: 182, distanceToNextNm: 0.78 )
    static let J_TO_BP      = CoraLeg ( begin: CoraMark.J    , end: CoraMark.BP    , headingToNextM: 189, distanceToNextNm: 1.0 )
    static let J_TO_FINISH  = CoraLeg ( begin: CoraMark.J    , end: CoraMark.FINISH, headingToNextM: 264, distanceToNextNm: 0.24 )
    
    static let G27_TO_R4    = CoraLeg ( begin: CoraMark.G27  , end: CoraMark.R4    , headingToNextM: 260, distanceToNextNm: 1.46)
    static let G27_TO_BP    = CoraLeg ( begin: CoraMark.G27  , end: CoraMark.BP    , headingToNextM: 254, distanceToNextNm: 1.63 )
    
    static let G37_TO_BP    = CoraLeg ( begin: CoraMark.G37  , end: CoraMark.BP    , headingToNextM: 187, distanceToNextNm: 2.0 )
    static let G37_TO_R4    = CoraLeg ( begin: CoraMark.G37  , end: CoraMark.R4    , headingToNextM: 184, distanceToNextNm: 1.78 )
    static let G37_TO_FINISH = CoraLeg( begin: CoraMark.G37  , end: CoraMark.FINISH, headingToNextM: 198, distanceToNextNm: 1.08 )
    
    static let R2_TO_R4     = CoraLeg ( begin: CoraMark.R2   , end: CoraMark.R4    , headingToNextM: 287, distanceToNextNm: 1.74 )
    static let R2_TO_FINISH = CoraLeg ( begin: CoraMark.R2   , end: CoraMark.FINISH, headingToNextM: 304, distanceToNextNm: 2.3 )
    
    static let R4_TO_R2     = CoraLeg ( begin: CoraMark.R4   , end: CoraMark.R2    , headingToNextM: 107, distanceToNextNm: 1.74 )
    static let R4_TO_G37    = CoraLeg ( begin: CoraMark.R4   , end: CoraMark.G37   , headingToNextM: 004, distanceToNextNm: 1.79 )
    static let R4_TO_FINISH = CoraLeg ( begin: CoraMark.R4   , end: CoraMark.FINISH, headingToNextM: 345, distanceToNextNm: 0.78 )
    
    static let BP_TO_JETI   = CoraLeg ( begin: CoraMark.BP   , end: CoraMark.JETI  , headingToNextM: 102, distanceToNextNm: 2.0 )
    static let R4_TO_JETI   = CoraLeg ( begin: CoraMark.R4   , end: CoraMark.JETI  , headingToNextM: 109, distanceToNextNm: 1.95 )
    static let R14_TO_JETI  = CoraLeg ( begin: CoraMark.R14  , end: CoraMark.JETI  , headingToNextM: 308, distanceToNextNm: 6.7 )
    static let G13_TO_JETI  = CoraLeg ( begin: CoraMark.G13  , end: CoraMark.JETI  , headingToNextM: 309, distanceToNextNm: 6.7 )
    static let G15_TO_JETI  = CoraLeg ( begin: CoraMark.G15  , end: CoraMark.JETI  , headingToNextM: 310, distanceToNextNm: 5.1 )
    
    static let JETI_TO_G15  = CoraLeg ( begin: CoraMark.JETI , end: CoraMark.G15   , headingToNextM: 130, distanceToNextNm: 5.1 )
    static let JETI_TO_G13  = CoraLeg ( begin: CoraMark.JETI , end: CoraMark.G13   , headingToNextM: 129, distanceToNextNm: 6.7 )
    static let JETI_TO_R14  = CoraLeg ( begin: CoraMark.JETI , end: CoraMark.R14   , headingToNextM: 128, distanceToNextNm: 6.7 )
    static let JETI_TO_R4   = CoraLeg ( begin: CoraMark.JETI , end: CoraMark.R4    , headingToNextM: 289, distanceToNextNm: 1.95 )
    
    static let R14_TO_RN2   = CoraLeg ( begin: CoraMark.R14  , end: CoraMark.RN2   , headingToNextM: 053, distanceToNextNm: 3.3 )
    static let RN2_TO_R14   = CoraLeg ( begin: CoraMark.RN2  , end: CoraMark.R14   , headingToNextM: 233, distanceToNextNm: 3.3 )
    static let RN2_TO_RWC   = CoraLeg ( begin: CoraMark.RN2  , end: CoraMark.RWC   , headingToNextM: 147, distanceToNextNm: 9.8 )
    
    static let G13_TO_RWC   = CoraLeg ( begin: CoraMark.G13  , end: CoraMark.RWC   , headingToNextM: 127, distanceToNextNm: 10.1 )
    static let RWC_TO_G13   = CoraLeg ( begin: CoraMark.RWC  , end: CoraMark.G13   , headingToNextM: 307, distanceToNextNm: 10.1 )
    static let RWC_TO_JETI  = CoraLeg ( begin: CoraMark.RWC  , end: CoraMark.JETI  , headingToNextM: 308, distanceToNextNm: 16.8 )
    
}

struct CoraCourses2015 {
    
    static let courses: [CoraCourse] = [
    
    
    /*
    COURSE 1 - 5.1 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    R “2” Fl R 2.5s PORT
    R “4” Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 1", distanceNm: 5.1, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_R2 ),
        CoraRounding( mark: CoraMark.R2,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.R2_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    
    /*
    COURSE 2 - 3.6 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    “J” PORT
    R “4” Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    
    CoraCourse( title: "Course 2", distanceNm: 3.6, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 3 - 3.1 NM
    START Starting mark and CYC dock
    “J” Port
    RG "BP" Fl (2+1) R 6s Port
    “J” Port
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 3", distanceNm: 3.1, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 4 - 4.6 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    G “27” Fl G 2.5s PORT
    R “4” Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 4", distanceNm: 4.6, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_G27 ),
        CoraRounding( mark: CoraMark.G27,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G27_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 5 – 2.4 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    “J” PORT
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 5", distanceNm: 2.4, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 6 – 2.1 NM
    START Starting mark and CYC dock “J” PORT
    R “4” Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 6", distanceNm: 2.1, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 7 – 7.9 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    G “27” Fl G 2.5s PORT
    RG "BP" Fl (2+1) R 6s PORT
    G “27” Fl G 2.5s PORT
    R “4” Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 7", distanceNm: 7.9, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_G27 ),
        CoraRounding( mark: CoraMark.G27,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G27_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_G27 ),
        CoraRounding( mark: CoraMark.G27,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G27_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 8 – 11.4 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    G “27” Fl G 2.5s PORT
    RG "BP" Fl (2+1) R 6s PORT
    G “27” Fl G 2.5s PORT
    RG "BP" Fl (2+1) R 6s PORT
    G “27” Fl G 2.5s PORT
    R “4” Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 8", distanceNm: 11.4, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_G27 ),
        CoraRounding( mark: CoraMark.G27,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G27_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_G27 ),
        CoraRounding( mark: CoraMark.G27,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G27_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_G27 ),
        CoraRounding( mark: CoraMark.G27,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G27_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 9 – 8.5 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    R "2" Fl R 2.5s PORT
    RG "BP" Fl (2+1) R 6s PORT
    R "2" Fl R 2.5s PORT
    R “4” Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 9", distanceNm: 8.5, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_R2 ),
        CoraRounding( mark: CoraMark.R2,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.R2_TO_R4 ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_R2 ),
        CoraRounding( mark: CoraMark.R2,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.R2_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 10 - 12.0 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    R "2" Fl R 2.5s PORT
    RG "BP" Fl (2+1) R 6s PORT
    R "2" Fl R 2.5s PORT
    RG "BP" Fl (2+1) R 6s PORT
    R "2" Fl R 2.5s PORT
    R “4” Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 10", distanceNm: 12.0, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_R2 ),
        CoraRounding( mark: CoraMark.R2,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.R2_TO_R4 ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_R2 ),
        CoraRounding( mark: CoraMark.R2,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.R2_TO_R4 ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_R2 ),
        CoraRounding( mark: CoraMark.R2,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.R2_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ]  ),
    
    
    /*
    COURSE 11 – 5.7 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    “J” PORT
    RG "BP" Fl (2+1) R 6s PORT
    “J” PORT
    R "4" Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 11", distanceNm: 5.7, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 12 – 7.9 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    “J” PORT
    RG "BP" Fl (2+1) R 6s PORT
    “J” PORT
    RG "BP" Fl (2+1) R 6s PORT
    “J” PORT
    R "4" Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 12", distanceNm: 7.9, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 13 – 5.2 NM
    START Starting mark and CYC dock
    “J” PORT
    RG "BP" Fl (2+1) R 6s PORT
    “J” PORT
    RG "BP" Fl (2+1) R 6s PORT
    “J” PORT
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 13", distanceNm: 5.2, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 14 – 7.7 NM
    START Starting mark and CYC dock
    “J” PORT
    RG "BP" Fl (2+1) R 6s PORT
    “J” PORT
    RG "BP" Fl (2+1) R 6s PORT
    “J” PORT
    RG "BP" Fl (2+1) R 6s PORT
    “J” PORT
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 14", distanceNm: 7.7, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_J ),
        CoraRounding( mark: CoraMark.J,     leaveTo: CoraRounding.port,  nextLeg: CoraLeg.J_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 15 – 5.47 NM
    START Starting mark and CYC dock
    G “37” Fl G 4s PORT
    R “4” FI R 4s PORT
    G “37” Fl G 4s PORT
    R “4” FI R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 15", distanceNm: 5.47, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_G37 ),
        CoraRounding( mark: CoraMark.G37,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G37_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.R4_TO_G37 ),
        CoraRounding( mark: CoraMark.G37,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G37_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 16 - 4.4 NM
    (NOT FOR “A” CLASS)
    START Starting mark and CYC dock
    R “2” Fl R 2.5s PORT
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 16 - Not for A Class", distanceNm: 4.4, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_R2 ),
        CoraRounding( mark: CoraMark.R2,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.R2_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 17 - 4.8 NM
    (“A” CLASS COMPANION TO COURSE 16)
    START Starting mark and CYC dock
    R “4” Fl R 4s PORT
    R “2” Fl R 2.5s PORT
    R “4” Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 17 - A Class Companion to 16", distanceNm: 4.8, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.R4_TO_R2 ),
        CoraRounding( mark: CoraMark.R2,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.R2_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R2_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 18 - 4 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    G “37” Fl G 4s PORT
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 18", distanceNm: 4.0, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_G37 ),
        CoraRounding( mark: CoraMark.G37,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G37_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 19 - 8 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    G “37” Fl R 2.5s PORT
    RG "BP" Fl (2+1) R 6s PORT
    G “37” Fl G 4s PORT
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 19", distanceNm: 8.0, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_G37 ),
        CoraRounding( mark: CoraMark.G37,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G37_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_G37 ),
        CoraRounding( mark: CoraMark.G37,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G37_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 20 – 4 NM
    START Starting mark and CYC dock
    G “37” FI G 4s PORT
    RG "BP" Fl (2+1) R 6s PORT
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 20", distanceNm: 4.0, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_G37 ),
        CoraRounding( mark: CoraMark.G37,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G37_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 21 – 8 NM
    START Starting mark and CYC dock
    G “37” FI G 4s PORT
    RG "BP" Fl (2+1) R 6s PORT
    G “37” Fl G 4s PORT
    RG "BP" Fl (2+1) R 6s PORT
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 21", distanceNm: 8.0, category: "Harbor", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_G37 ),
        CoraRounding( mark: CoraMark.G37,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G37_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_G37 ),
        CoraRounding( mark: CoraMark.G37,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G37_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    // ---------- BEGINNING OF Offshore Courses --------------
    
    COURSE 22 - 23.4 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    R "14" Fl R 2.5s BELL PORT
    RN "2" (Rattlesnake) PORT
    R "14" Fl R 2.5s BELL STARBOARD
    R "4" Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 22 - JETI", distanceNm: 23.4, category: "Offshore", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_JETI ),
        CoraRounding( mark: CoraMark.JETI,  leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.JETI_TO_R14 ),
        CoraRounding( mark: CoraMark.R14,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.R14_TO_RN2 ),
        CoraRounding( mark: CoraMark.RN2,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.RN2_TO_R14 ),
        CoraRounding( mark: CoraMark.R14,   leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R14_TO_JETI ),
        CoraRounding( mark: CoraMark.JETI,  leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.JETI_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 23 - 39.2 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    G “13” Fl G 2.5s STARBOARD
    RW “C” Mo (A) WHIS PORT
    G “13” Fl G 2.5s PORT
    R "4" Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 23", distanceNm: 39.2, category: "Offshore", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_JETI ),
        CoraRounding( mark: CoraMark.JETI,  leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.JETI_TO_G13 ),
        CoraRounding( mark: CoraMark.G13,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.G13_TO_RWC ),
        CoraRounding( mark: CoraMark.RWC,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.RWC_TO_G13 ),
        CoraRounding( mark: CoraMark.G13,   leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.G13_TO_JETI ),
        CoraRounding( mark: CoraMark.JETI,  leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.JETI_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 24 - 33.8 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    G “13” Fl G 2.5s STARBOARD
    R "4" Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 24", distanceNm: 33.8, category: "Offshore", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_JETI ),
        CoraRounding( mark: CoraMark.JETI,  leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.JETI_TO_G13 ),
        CoraRounding( mark: CoraMark.G13,   leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.G13_TO_JETI ),
        CoraRounding( mark: CoraMark.JETI,  leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.JETI_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ] ),
    
    /*
    COURSE 25 - 52.6 NM
    START Starting mark and CYC dock
    R "4" Fl R 4s PORT
    R "14" Fl R 2.5s BELL PORT
    RN "2" (Rattlesnake) STARBOARD
    RW “C” Mo (A) WHIS STARBOARD
    R "4" Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 25", distanceNm: 52.6, category: "Offshore", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.R4_TO_JETI ),
        CoraRounding( mark: CoraMark.JETI,  leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.JETI_TO_R14 ),
        CoraRounding( mark: CoraMark.R14,   leaveTo: CoraRounding.port,  nextLeg: CoraLeg.R14_TO_RN2 ),
        CoraRounding( mark: CoraMark.RN2,   leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.RN2_TO_RWC ),
        CoraRounding( mark: CoraMark.RWC,   leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.RWC_TO_JETI ),
        CoraRounding( mark: CoraMark.JETI,  leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.JETI_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ]  ),
    
    /*
    COURSE 26 - 11.7 NM
    START Starting mark and CYC dock
    RG "BP" Fl (2+1) R 6s PORT
    G "15" Fl G 2.5s BELL PORT
    R "4" Fl R 4s STARBOARD
    FINISH Finishing mark and CYC dock
    */
    CoraCourse( title: "Course 26", distanceNm: 11.7, category: "Offshore", marks:[
        CoraRounding( mark: CoraMark.START, leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.START_TO_BP ),
        CoraRounding( mark: CoraMark.BP,    leaveTo: CoraRounding.port,  nextLeg: CoraLeg.BP_TO_JETI ),
        CoraRounding( mark: CoraMark.JETI,  leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.JETI_TO_G15 ),
        CoraRounding( mark: CoraMark.G15,   leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.G15_TO_JETI ),
        CoraRounding( mark: CoraMark.JETI,  leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.JETI_TO_R4 ),
        CoraRounding( mark: CoraMark.R4,    leaveTo: CoraRounding.STBD,  nextLeg: CoraLeg.R4_TO_FINISH ),
        CoraRounding( mark: CoraMark.FINISH,leaveTo: CoraRounding.NONE,  nextLeg: CoraLeg.NONE )
        ]  )
]
}


//  Unit Test 1- Make sure that the start leg == the mark

//  Unit Test 2 - make sure next mark == finish of the leg.

// Unit Test 3 - Do Leg distances add up to the course distance?

// Unit Test 4 - Make sure that the reciprocal legs are actually reciprocal.


