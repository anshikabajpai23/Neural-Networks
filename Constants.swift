//
//  Constants.swift
//  Kerala Ayurveda Connect
//
//  Created by MacBook on 29/08/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct apiSubServiceName {
    static let login = "WebServices/PatientMobileData.asmx"
    static let reset = "WebServices/GeneralUtility.asmx"
    static let getPatientComplaint = "/WebServices/kiosknewdata.asmx"
    static let getMasterdataofpatientExamination = "WebServices/Ayurveda.asmx"
}
struct apiMethodName {
    static let AuthenticatePatient = "AuthenticatePatient"
    static let ForgotPassword = "ForgotPassword"
    static let VerifyOTP = "VerifyOTP"
    static let GetPatientAppCommonData = "GetPatientAppCommonData"
    static let GetHospitalList = "GetHospitalList"
    static let PatientAppointments = "PatientAppointments"
    static let LogOutPatient = "LogOutPatient"
    static let GetHospitalDoctotList = "GetHospitalDoctorList"
    static let GetPatientComplaintCompleteDetails = "GetPatientComplaintCompleteDetails"
    static let GetMasterExamination = "GetAllAyurvedaModules"
    static let VitalsUpdate = "UpdatePatientEMR"
    static let UploadPatFiles = "UploadPatFiles"
    static let UpdateProfile = "UpdateProfile"
    static let checkPatientsPaymentStatus = "CheckPatientsPaymentStatus"
    static let startVCwithDoctor = "StartVCwithDoctor"
    static let bookAppointment = "BookAppointment"
    static let getAllAyurvedaModules = "GetAllAyurvedaModules"
    static let getBuymedicine = "Buymedicine"
    static let emailMedicinetoPharmacy = "EmailMedicinetoPharmacy"
    static let getComplaintsList = "GetComplaintsList"
    static let GetKALProductList = "GetKALProductList"
    static let PatientPlaceMedicineOrder = "PatientPlaceMedicineOrder"
    static let GetMasterHabits = "GetMasterHabits"
    static let GetMasterEthnicities = "GetMasterEthnicities"
    static let SavePatientcomplaintDetails = "SavePatientcomplaintDetails"
    static let SavePatientInternalDetails = "SavePatientInternalDetails"
    static let SavePatientProblems = "SavePatientProblems"
    static let SavePatientDignosedMedicalConditions = "SavePatientDignosedMedicalConditions"
    static let SavePatientMedicinesAndSuppliments = "SavePatientMedicinesAndSuppliments"
    static let SavePatientDiseasesHospitalizationSurgeries = "SavePatientDiseasesHospitalizationSurgeries"
    static let SavePatientRatingsMealHabits = "SavePatientRatingsMealHabits"
    static let SavePatientMealHabitRatings = "SavePatientMealHabitRatings"
    static let SavePatientHabits = "SavePatientHabits"
    static let SavePatientPreferences = "SavePatientPreferences"
    static let GetMasterHereditary = "GetMasterHereditary"
    static let GetHealthseekerMasterData = "GetHealthseekerMasterData"
    static let GetPatientSymptoms = "GetPatientSymptoms"
    static let GetPatientInternalDetails = "GetPatientInternalDetails"
    static let SavePatientSymptoms = "SavePatientSymptoms"
    static let GetPatientHereditaryDiseases = "GetPatientHereditaryDiseases"
    static let GetPatientDignosedMedicalConditions = "GetPatientDignosedMedicalConditions"
    static let GetPatientMedicinesAndSuppliments = "GetPatientMedicinesAndSuppliments"
    static let GetPatientDiseasesHospitalizationSurgeries = "GetPatientDiseasesHospitalizationSurgeries"
    static let GetPatientMealHabitsStressEnergyRating = "GetPatientMealHabitsStressEnergyRating"
    static let GetPatientMealHabitRatings = "GetPatientMealHabitRatings"
    static let GetPatientHabits = "GetPatientHabits"
    static let GetPatientPreferences = "GetPatientPreferences"
    static let SavePatientHereditaryDiseases = "SavePatientHereditaryDiseases"
}
struct apiNamespace {
    static let name = "https://kalpamus.myayurveda.com"
}

struct nsUserDetaultName {
    static let LoginUserData = "LoginUserData"
}
struct errorMessages {
    static let noInternet = "Sorry, internet connection not available, please try again."
    static let noDataFound = "Data Not Available"
    static let somthingWrong = "Something is wrong. Please try later."
    static let PdfNotSave = "Pdf could not be saved"
}
//MARK:- Save & Retrieve User Object
func saveCustomObject(_ object: NSDictionary, key: String) {
    let encodedObject = NSKeyedArchiver.archivedData(withRootObject: object)
    let defaults = UserDefaults.standard
    defaults.set(encodedObject, forKey: key)
    defaults.synchronize()
}
func loadCustomObject(withKey key: String) -> NSDictionary? {
    let defaults = UserDefaults.standard
    let encodedObject: Data? = defaults.object(forKey: key) as! Data?
    if encodedObject != nil {
        let object: NSDictionary? = NSKeyedUnarchiver.unarchiveObject(with: encodedObject!) as! NSDictionary?
        return object!
    }
    return nil
}
func getOffset() -> Int
{
    let currentDate = Date()
    let CurrentTimeZone = NSTimeZone(abbreviation: "GMT")
    let SystemTimeZone = NSTimeZone.system as NSTimeZone
    if let currentGMTOffset: Int = CurrentTimeZone?.secondsFromGMT(for: currentDate){
        let SystemGMTOffset: Int = SystemTimeZone.secondsFromGMT(for: currentDate)
        let interval = TimeInterval((SystemGMTOffset - currentGMTOffset ))
        let finaloffset : Int = (Int(interval/60))
        return finaloffset
    }
    else{
        return 330
    }
    
}
func isValidDate(dateString: String,formatter: String) -> Bool {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = formatter
    if let _ = dateFormatterGet.date(from: dateString) {
        //date parsing succeeded, if you need to do additional logic, replace _ with some variable name i.e date
        return true
    } else {
        // Invalid date
        return false
    }
}
