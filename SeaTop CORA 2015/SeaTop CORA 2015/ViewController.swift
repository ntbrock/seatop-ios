//
//  ViewController.swift
//  SeaTop CORA 2015
//
//  Created by Nathaniel Brockman on 1/25/15.
//  Copyright (c) 2015 Nathaniel Brockman. All rights reserved.
//

import UIKit


class CourseTableViewCell : UITableViewCell {
    
    //@IBOutlet var backgroundImage: UIImageView
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    
    @IBOutlet var row1Left: UILabel!
    @IBOutlet var row1Center: UILabel!
    @IBOutlet var row1Right: UILabel!

    @IBOutlet var row2Left: UILabel!
    @IBOutlet var row2Center: UILabel!
    @IBOutlet var row2Right: UILabel!

    @IBOutlet var row3Left: UILabel!
    @IBOutlet var row3Center: UILabel!
    @IBOutlet var row3Right: UILabel!

    @IBOutlet var row4Left: UILabel!
    @IBOutlet var row4Center: UILabel!
    @IBOutlet var row4Right: UILabel!

    @IBOutlet var row5Left: UILabel!
    @IBOutlet var row5Center: UILabel!
    @IBOutlet var row5Right: UILabel!

    @IBOutlet var row6Left: UILabel!
    @IBOutlet var row6Center: UILabel!
    @IBOutlet var row6Right: UILabel!

    @IBOutlet var row7Left: UILabel!
    @IBOutlet var row7Center: UILabel!
    @IBOutlet var row7Right: UILabel!

    @IBOutlet var row8Left: UILabel!
    @IBOutlet var row8Center: UILabel!
    @IBOutlet var row8Right: UILabel!

    @IBOutlet var row9Left: UILabel!
    @IBOutlet var row9Center: UILabel!
    @IBOutlet var row9Right: UILabel!

    @IBOutlet var row10Left: UILabel!
    @IBOutlet var row10Center: UILabel!
    @IBOutlet var row10Right: UILabel!

    
    func blankLabels() {
        row1Left.text = ""
        row1Center.text = ""
        row1Right.text = ""

        row2Left.text = ""
        row2Center.text = ""
        row2Right.text = ""

        row3Left.text = ""
        row3Center.text = ""
        row3Right.text = ""

        row4Left.text = ""
        row4Center.text = ""
        row4Right.text = ""

        row5Left.text = ""
        row5Center.text = ""
        row5Right.text = ""

        row6Left.text = ""
        row6Center.text = ""
        row6Right.text = ""

        row7Left.text = ""
        row7Center.text = ""
        row7Right.text = ""

        row8Left.text = ""
        row8Center.text = ""
        row8Right.text = ""

        row9Left.text = ""
        row9Center.text = ""
        row9Right.text = ""

        row10Left.text = ""
        row10Center.text = ""
        row10Right.text = ""

    }
    
    
    func loadItem(course: CoraCourse) {
        blankLabels()
        
        titleLabel.text = course.title
               
        distanceLabel.text = String(format:"%0.1f nm", course.distanceNm )
        
        if(course.marks.count > 0 ) {
            row1Left.text = course.marks[0].mark.name
            row1Center.text = course.marks[0].leaveTo
            if ( course.marks[0].nextLeg.headingToNextM > 0 ) {
                row1Right.text = String(format: "%03d M", course.marks[0].nextLeg.headingToNextM)
            }
        }

        if(course.marks.count > 1 ) {
            row2Left.text = course.marks[1].mark.name
            row2Center.text = course.marks[1].leaveTo
            if ( course.marks[1].nextLeg.headingToNextM > 0 ) {
                row2Right.text = String(format: "%03d M", course.marks[1].nextLeg.headingToNextM)
            }
        }
        

        if(course.marks.count > 2 ) {
            row3Left.text = course.marks[2].mark.name
            row3Center.text = course.marks[2].leaveTo
            if ( course.marks[2].nextLeg.headingToNextM > 0 ) {
            row3Right.text = String(format: "%03d M", course.marks[2].nextLeg.headingToNextM)
            }
        }

        if(course.marks.count > 3 ) {
            row4Left.text = course.marks[3].mark.name
            row4Center.text = course.marks[3].leaveTo
            if ( course.marks[3].nextLeg.headingToNextM > 0 ) {
                row4Right.text = String(format: "%03d M", course.marks[3].nextLeg.headingToNextM)
            }
        }

        if(course.marks.count > 4 ) {
            row5Left.text = course.marks[4].mark.name
            row5Center.text = course.marks[4].leaveTo
            if ( course.marks[4].nextLeg.headingToNextM > 0 ) {
                row5Right.text = String(format: "%03d M", course.marks[4].nextLeg.headingToNextM)
            }
        }
        if(course.marks.count > 5 ) {
            row6Left.text = course.marks[5].mark.name
            row6Center.text = course.marks[5].leaveTo
            if ( course.marks[5].nextLeg.headingToNextM > 0 ) {
                row6Right.text = String(format: "%03d M", course.marks[5].nextLeg.headingToNextM)
            }
        }
        if(course.marks.count > 6 ) {
            row7Left.text = course.marks[6].mark.name
            row7Center.text = course.marks[6].leaveTo
            if ( course.marks[6].nextLeg.headingToNextM > 0 ) {
                row7Right.text = String(format: "%03d M", course.marks[6].nextLeg.headingToNextM)
            }
        }
        if(course.marks.count > 7 ) {
            row8Left.text = course.marks[7].mark.name
            row8Center.text = course.marks[7].leaveTo
            if ( course.marks[7].nextLeg.headingToNextM > 0 ) {
                row8Right.text = String(format: "%03d M", course.marks[7].nextLeg.headingToNextM)
            }
        }
        if(course.marks.count > 8 ) {
            row9Left.text = course.marks[8].mark.name
            row9Center.text = course.marks[8].leaveTo
            if ( course.marks[8].nextLeg.headingToNextM > 0 ) {
                row9Right.text = String(format: "%03d M", course.marks[8].nextLeg.headingToNextM)
            }
        }
        if(course.marks.count > 9 ) {
            row10Left.text = course.marks[9].mark.name
            row10Center.text = course.marks[9].leaveTo
            if ( course.marks[9].nextLeg.headingToNextM > 0 ) {
                row10Right.text = String(format: "%03d M", course.marks[9].nextLeg.headingToNextM)
            }
        }
        
    }
    
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

 
    //var items: [String] = ["We", "Heart", "Swift"]
    var items: [CoraCourse] = CoraCourses2015.courses
    
    
    @IBOutlet
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        var nib = UINib(nibName: "CourseTableViewCell", bundle: nil)
        
        self.tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        /*
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row].title
        
        return cell
        */
    
        var cell:CourseTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! CourseTableViewCell
        
        // this is how you extract values from a tuple
        cell.loadItem(items[indexPath.row])
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
         print("You selected cell #\(indexPath.row)!")
    }
}

