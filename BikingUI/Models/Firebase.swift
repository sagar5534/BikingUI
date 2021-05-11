//
//  Firebase.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-23.
//

// import FirebaseFirestore
// import FirebaseFirestoreSwift
//
// class FirebaseManager: ObservableObject {
//
//
//
//    //    private func getActivity() {
//    //        db.collection("users").document("AKNdoblQtARRCjmQN7aH").collection("activity")
//    //            .order(by: "date", descending: true)
//    //            .addSnapshotListener { qu, error in
//    //
//    //                guard let docs = qu?.documents else {
//    //                    print("No Docs")
//    //                    return
//    //                }
//    //
//    //                self.activity = docs.compactMap { (QueryDocumentSnapshot) -> Activity? in
//    //                    let result = Result {
//    //                        try QueryDocumentSnapshot.data(as: Activity.self)
//    //                    }
//    //                    switch result {
//    //                    case let .success(city):
//    //                        if let city = city {
//    //                            print("Activity: \(city)")
//    //                            return city
//    //                        } else {
//    //                            print("Document does not exist" + city.debugDescription)
//    //                            return nil
//    //                        }
//    //                    case let .failure(error):
//    //                        print("Error decoding city: \(error)")
//    //                        return nil
//    //                    }
//    //                }
//    //            }
//    //    }
//
//    //    private func getUser() {
//    //        db.collection("users").document("AKNdoblQtARRCjmQN7aH")
//    //            .addSnapshotListener { documentSnapshot, error in
//    //                guard let document = documentSnapshot else {
//    //                    print("Error fetching document: \(error!)")
//    //                    return
//    //                }
//    //
//    //                let result = Result {
//    //                    try document.data(as: User.self)
//    //                }
//    //                switch result {
//    //                case let .success(city):
//    //                    if let city = city {
//    //                        print("User: \(city)")
//    //                        self.user = city
//    //                    } else {
//    //                        print("Document does not exist" + city.debugDescription)
//    //                    }
//    //                case let .failure(error):
//    //                    print("Error decoding city: \(error)")
//    //                }
//    //            }
//    //    }
//    //
//    //    func addActivity(activity: Activity) {
//    //
//    //        do {
//    //            try db.collection("users").document("AKNdoblQtARRCjmQN7aH").collection("activity")
//    //                .addDocument(from: activity, completion: { _ in
//    //                    print("Added")
//    //                    //self.getActivity()
//    //                })
//    //
//    //        } catch {
//    //            print(error)
//    //        }
//    //    }
// }
