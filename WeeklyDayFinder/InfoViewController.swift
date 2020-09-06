//
//  InfoViewController.swift
//  WeeklyDayFinder
//
//  Created by alina.jarmolica on 06/09/2020.
//  Copyright © 2020 alina.jarmolica. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescLabel: UILabel!
    
    var infoText = String()
    let appDescText = "This app is a home work project. \n Which day of the week is your day? \n Check dark/light mode."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDescLabel.text = appDescText
 
        if !infoText.isEmpty{
            appInfoLabel.text = infoText
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("dismiss VC")
    }
    
}
