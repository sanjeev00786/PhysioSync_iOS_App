//
//  TherapistProfileVC.swift
//  PhysioSync
//
//  Created by Gurmeet Singh on 2024-06-13.
//

import UIKit

class TherapistProfileVC: UIViewController {

    @IBOutlet weak var profileImgVW: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    var patient: Patient?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.getPatientLoginId() != "" {
            callGetPatientProfileApi()
        } else {
            profileImgVW.setImage(with: UserDefaults.standard.getTherapistProfileImage())
            nameLbl.text = UserDefaults.standard.getTherapistName()
            emailLbl.text = UserDefaults.standard.getTherapistName()
        }
    }
    
    func callGetPatientProfileApi() {
        let url = API.Endpoints.getPatient + "/\(UserDefaults.standard.getPatientLoginId())"
        ApiHelper.shareInstance.getApi(view: self, url: url, isHeader: false, isLoader: true) { json, err in
            print(json)
            if err != nil {
                self.displayAlert(title: "Alert!", msg: "something went wrong", ok: "Ok")
            } else {
                self.patient = Patient(json["data"][0])
                DispatchQueue.main.async {
                    if let model = self.patient {
                        self.profileImgVW.setImage(with: model.profilePhoto)
                        self.nameLbl.text = model.firstName
                        self.emailLbl.text = model.patientEmail
                    }
                }

            }
        }
    }
    
    @IBAction func editProfileBtnActn(_ sender: UIButton) {
        if UserDefaults.standard.getPatientLoginId() != "" {
            if let vc = self.switchController(.therapistPatientStep1VC, .therapistPatientProfile) as? TherapistPatientStep1VC {
                vc.isEdit = true
                vc.model = patient
                vc.isPatientSide = true
                self.pushOrPresentViewController(vc, true)
            }
        } else {
            if let vc = self.switchController(.therapistProfileStep1VC, .therapistProfile) {
                self.pushOrPresentViewController(vc, true)
            }
        }
        
    }

}
