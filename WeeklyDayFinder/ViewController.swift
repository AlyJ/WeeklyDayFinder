//
//  ViewController.swift
//  WeeklyDayFinder
//
//  Created by alina.jarmolica on 02/09/2020.
//  Copyright © 2020 alina.jarmolica. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var dayTextFill: UITextField!
    @IBOutlet weak var monthTextFill: UITextField!
    @IBOutlet weak var yearTextFill: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //this func makes the numer keyboead disapear when you click on any other space on the view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
func handleCalculation(){
    
        let calendar = Calendar.current
    
        var dateComponent = DateComponents()
    
    guard let day = dayTextFill.text, let month = monthTextFill.text, let year = yearTextFill.text else {
        return
    }
        dateComponent.day = Int(day)
        dateComponent.month = Int(month)
        dateComponent.year = Int(year)
        
    guard let date = calendar.date(from: dateComponent) else {
        print("error")
        return
    }
    
         let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "lv_LV")
        dateFormatter.dateFormat = "EEEE"
        
        let weekday = dateFormatter.string(from: date)
        
        resultLabel.text = weekday
        
        
    }
    
    
    @IBAction func findWeekdayTapped(_ sender: Any) {
        handleCalculation()
    }
    
}

