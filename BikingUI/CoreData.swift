//
//  CoreData.swift
//  BikingUI
//
//  Created by Sagar on 2021-04-22.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

class CoreData: ObservableObject {
    static let sharedInstance = CoreData()
    private var db = Firestore.firestore()

    @Published var name = ""

    func getName() {
        db.collection("test").document("8AfzvuOdRmpcHyraDgEb")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                self.name = data["Name"] as! String
                print("Current data: \(data)")
            }
    }
}
