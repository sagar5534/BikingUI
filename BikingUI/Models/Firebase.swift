//
//  Firebase.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-23.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseManager: ObservableObject {
    @Published var data: User = User(name: "", distance: 0, movingTime: 0, trips: 0, avgSpeed: 0, activity: [])
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("users").document("AKNdoblQtARRCjmQN7aH")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                
                let name = data["name"] as? String ?? ""
                let distance = data["distance"] as? Double ?? 0
                let movingTime = data["movingTime"] as? Double ?? 0
                let trips = data["trips"] as? Int ?? 0
                let avgSpeed = data["avgSpeed"] as? Double ?? 0
                
                
                self.data = User(
                    name: name,
                    distance: distance,
                    movingTime: movingTime,
                    trips: trips,
                    avgSpeed: avgSpeed,
                    activity: [Activity()]
                )
                
            }
    }
}
