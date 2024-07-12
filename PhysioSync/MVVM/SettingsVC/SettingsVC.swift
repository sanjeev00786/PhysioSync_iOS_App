//
//  SettingsVC.swift
//  PhysioSync
//
//  Created by Gurmeet Singh on 2024-07-11.
//

import UIKit
import Hero

class SettingsVC: UIViewController {

    @IBOutlet weak var reminderView: UIView!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var reminderPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isHeroEnabled = true
        if UserDefaults.standard.getUsernameToken() == "" {
            self.reminderView.isHidden = false
        } else {
            self.reminderView.isHidden = true
        }
        if let time = UserDefaults.standard.value(forKey: "reminder_time") as? String {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "hh:mm a"
            if let date = timeFormatter.date(from: time) {
                reminderPicker.date = date
            } else {
                print("Date conversion failed")
            }
        }
        reminderPicker.addTarget(self, action: #selector(reminderPickerBtnActn(_ :)), for: .valueChanged)
    }
    
    @objc func reminderPickerBtnActn(_ sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm a"
        let str = timeFormatter.string(from: sender.date)
        print(str)
        UserDefaults.standard.setValue(str, forKey: "reminder_time")
    }
    
    @objc func darkModeSwitchBtnActn(_ sender: UIDatePicker) {
        
    }
    
    @IBAction func crossBtnActn(_ sender: UIButton) {
        self.heroModalAnimationType = .slide(direction: .down)
        self.dismissOrPopViewController()
    }
    
    @IBAction func changePasswordBtnActn(_ sender: UIButton) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC") as? ChangePasswordVC {
            self.pushOrPresentViewController(vc, true)
        }
    }
}