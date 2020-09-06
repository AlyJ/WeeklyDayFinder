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
    
    @IBOutlet weak var findButton: UIButton!
    
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
    
    guard let day = Int(dayTextFill.text!), let month = Int(monthTextFill.text!), let year = Int(yearTextFill.text!) else {
        warningPopup(withTitle: "Input Error", withMessage: "Dat text field cant be empty")
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
    
    switch findButton.titleLabel?.text {
    case "Find":
        findButton.setTitle("Clear", for: .normal)
        if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
            let weekday = dateFormatter.string(from: date)
            resultLabel.text = weekday
        }else{
            warningPopup(withTitle: "Wrong Date!", withMessage: "Please enter correct date.")
        }
    default:
        findButton.setTitle("Find", for: .normal)
        clearTextField()
    }
        
    }
    
    func clearTextField() {
        dayTextFill.text = ""
        monthTextFill.text = ""
        yearTextFill.text = ""
        resultLabel.text = "Find a weekday"
    }
     
    func warningPopup(withTitle title: String?, withMessage message: String?) {
        
        DispatchQueue.main.async {
            let popUP = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            popUP.addAction(okButton)
            self.present(popUP, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func findWeekdayTapped(_ sender: Any) {
        handleCalculation()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InfoSegue" {
        // Get the new view controller using segue.destination.
            let vc = segue.destination as! InfoViewController
        // Pass the selected object to the new view controller.
            vc.infoText = "DayFinder helps you to find \n your weekday for given date"
            
        }
    }
    
}

