//
//  Start_VModel.swift
//  BikingUI
//
//  Created by Sagar on 2021-04-23.
//

import Foundation
import Firebase

class Start_VModel: ObservableObject {
    
    @Published var name = ""

    static let sharedInstance = Start_VModel()

    private var db = Firestore.firestore()
    private var listenerRegistration: ListenerRegistration?
    private var dbRef = Firestore.firestore().collection("test")
    
    deinit {
        print("Destroying Start")
        unsubscribe()
    }
    
    func unsubscribe() {
        if listenerRegistration != nil {
            listenerRegistration?.remove()
            listenerRegistration = nil
        }
    }
    
    init() {
        print("Calling init")
        startListener()
    }
    
    func startListener() {
        let query = dbRef.document("8AfzvuOdRmpcHyraDgEb")
        
        query.addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            guard let data = document.data() else {
                print("Document data was empty.")
                return
            }
            print("Current data: \(data)")
            self.name = data["Name"] as! String
        }
        
    }
    
}
