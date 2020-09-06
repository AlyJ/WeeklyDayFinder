//
//  AppearenceViewController.swift
//  WeeklyDayFinder
//
//  Created by alina.jarmolica on 06/09/2020.
//  Copyright © 2020 alina.jarmolica. All rights reserved.
//

import UIKit

class AppearenceViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openSettingsTapped(_ sender: Any) {
        
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsURL){
            UIApplication.shared.open(settingsURL, options: [:]) { (success) in
                print(success)
            }
        }
        func setLabelText() {
            var text = "Unable to specify UI style"
            if self.traitCollection.userInterfaceStyle == .dark {
                text = "Dark Mode is On. \nGo to settings if you would like \nto change to Light Mode."
            } else {
                text = "Light Mode is On. \nGo to settings if you would like \nto change to Dark Mode."
            }
            textLabel.text = text
        }
    }

}

extension AppearenceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    }
}
