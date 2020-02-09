//
//  ViewController.swift
//  CocoaPractice
//
//  Created by cse on 2020. 2. 6..
//  Copyright © 2020년 cse. All rights reserved.
//

import UIKit
import FSCalendar
import Toast_Swift

class ViewController: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func timeString(time:TimeInterval)->String {
        let date = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        let timezone = TimeZone.current.abbreviation() ?? "CET"  // get current TimeZone abbreviation or set to CET
        dateFormatter.timeZone = TimeZone(abbreviation: timezone) //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd일" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    

}

extension ViewController :FSCalendarDelegate,FSCalendarDataSource{
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.view.makeToast(timeString(time: date.timeIntervalSince1970))
    }
}

extension FSCalendar {
    
}
