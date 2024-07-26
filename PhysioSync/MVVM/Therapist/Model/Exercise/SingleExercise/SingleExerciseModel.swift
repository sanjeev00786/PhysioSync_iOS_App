//
//  SingleExerciseModel.swift
//  PhysioSync
//
//  Created by Rohit on 2024-06-20.
//

import Foundation
import SwiftyJSON

class SingleExerciseModel {
    var videoTitle: String
    var categoryName = [String]()
    var categoryId = [String]()
    var description: String
    var id: String
    var videoUrl: String
    var therapistId: String
    var version: Int
    var isSelected = false
    var video_thumbnail = ""
    var isAssigned = false
    var isAwaitingReview = false
    var status = ""
    var patient_video_url = ""
    var patient_exercise_completion_date_time = ""
    
    init(_ json: JSON) {
        categoryId.removeAll()
        categoryName.removeAll()
        for i in json["exercise_id"]["category_name"].arrayValue {
            categoryName.append(i.stringValue)
        }
        for i in json["exercise_id"]["category_id"].arrayValue {
            categoryId.append(i.stringValue)
        }
        videoTitle = json["exercise_id"]["video_title"].stringValue
        description = json["exercise_id"]["description"].stringValue
        id = json["exercise_id"]["_id"].stringValue
        videoUrl = json["exercise_id"]["video_Url"].stringValue
        therapistId = json["exercise_id"]["therapist_id"].stringValue
        version = json["exercise_id"]["__v"].intValue
        video_thumbnail = json["exercise_id"]["video_thumbnail"].stringValue
        isAssigned = json["is_assigned"].boolValue
        isAwaitingReview = json["is_awaiting_reviews"].boolValue
        status = json["status"].stringValue
        patient_video_url = json["exercise_id"]["patient_video_url"].stringValue
        patient_exercise_completion_date_time = json["exercise_id"]["patient_exercise_completion_date_time"].stringValue

    }
    
    init(videoTitle: String, categoryName: [String], categoryId: [String], description: String, id: String, videoUrl: String, therapistId: String, version: Int, isSelected: Bool = false, videoThumbnail: String, isAssigned: Bool = false, isAwaitingReview: Bool = false) {
        self.videoTitle = videoTitle
        self.categoryName = categoryName
        self.categoryId = categoryId
        self.description = description
        self.id = id
        self.videoUrl = videoUrl
        self.therapistId = therapistId
        self.version = version
        self.isSelected = isSelected
        self.video_thumbnail = videoThumbnail
        self.isAssigned = isAssigned
        self.isAwaitingReview = isAwaitingReview
    }
}

class SingleExerciseModel2 {
    var videoTitle: String
    var categoryName = [String]()
    var categoryId = [String]()
    var description: String
    var id: String
    var videoUrl: String
    var therapistId: String
    var version: Int
    var isSelected = false
    var video_thumbnail = ""
    var isAssigned = false
    var isAwaitingReview = false
    var patient_video_url = ""
    var patient_exercise_completion_date_time = ""
    var video_title = ""
    
    init(_ json: JSON) {
        categoryId.removeAll()
        categoryName.removeAll()
        for i in json["category_name"].arrayValue {
            categoryName.append(i.stringValue)
        }
        for i in json["category_id"].arrayValue {
            categoryId.append(i.stringValue)
        }
        videoTitle = json["video_title"].stringValue
        description = json["description"].stringValue
        if json["exercise_id"].exists() {
            id = json["exercise_id"]["_id"].stringValue
        } else {
            id = json["_id"].stringValue
        }
        videoUrl = json["video_Url"].stringValue
        therapistId = json["therapist_id"].stringValue
        version = json["__v"].intValue
        video_thumbnail = json["video_thumbnail"].stringValue
        isAssigned = json["is_assigned"].boolValue
        isAwaitingReview = json["is_awaiting_reviews"].boolValue
        patient_video_url = json["patient_video_url"].stringValue
        patient_exercise_completion_date_time = json["patient_exercise_completion_date_time"].stringValue
        video_title = json["video_title"].stringValue
    }
    
    init(videoTitle: String, categoryName: [String], categoryId: [String], description: String, id: String, videoUrl: String, therapistId: String, version: Int, isSelected: Bool = false, videoThumbnail: String, isAssigned: Bool = false, isAwaitingReview: Bool = false) {
        self.videoTitle = videoTitle
        self.categoryName = categoryName
        self.categoryId = categoryId
        self.description = description
        self.id = id
        self.videoUrl = videoUrl
        self.therapistId = therapistId
        self.version = version
        self.isSelected = isSelected
        self.video_thumbnail = videoThumbnail
        self.isAssigned = isAssigned
        self.isAwaitingReview = isAwaitingReview
    }
}
