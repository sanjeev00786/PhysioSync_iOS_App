//
//  Constants.swift
//  PhysioSync
//
//  Created by Sanjeev Mehta on 22/05/24.
//

import UIKit

struct Colors {
    
    static let primaryClr = UIColor(named: "primary")!
    static let primarySubtleClr = UIColor(named: "primary-subtle")!
    static let borderClr = UIColor(named: "borderClr")!

}

enum Storyboard: String {
    case main = "Main"
    
    // MARK: - Therapist
    case therapistOnboarding = "TherapistOnboarding"
    
    // MARK: - Patient Auth
    case patientAuth = "PatientAuth"
}
