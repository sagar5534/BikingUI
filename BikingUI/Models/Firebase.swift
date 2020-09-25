//
//  Firebase.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-23.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseManager: ObservableObject {
    @Published var user: User = User()
    @Published var activity: [Activity] = []

    private var db = Firestore.firestore()

    func fetchData() {
        getUser()
        getActivity()
    }

    private func getActivity() {
        db.collection("users").document("AKNdoblQtARRCjmQN7aH").collection("activity")
            .addSnapshotListener { qu, error in

                guard let docs = qu?.documents else {
                    print("No Docs")
                    return
                }

                self.activity = docs.compactMap { (QueryDocumentSnapshot) -> Activity? in
                    // return try? QueryDocumentSnapshot.data(as: Activity.self)

                    let result = Result {
                        try QueryDocumentSnapshot.data(as: Activity.self)
                    }
                    switch result {
                    case let .success(city):
                        if let city = city {
                            // A `City` value was successfully initialized from the DocumentSnapshot.
                            print("City: \(city)")
                            return city
                        } else {
                            // A nil value was successfully initialized from the DocumentSnapshot,
                            // or the DocumentSnapshot was nil.
                            print("Document does not exist" + city.debugDescription)
                            return nil
                        }
                    case let .failure(error):
                        // A `City` value could not be initialized from the DocumentSnapshot.
                        print("Error decoding city: \(error)")
                        return nil
                    }
                }
            }
    }

    private func getUser() {
        db.collection("users").document("AKNdoblQtARRCjmQN7aH")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }

                let result = Result {
                    try document.data(as: User.self)
                }
                switch result {
                case let .success(city):
                    if let city = city {
                        // A `City` value was successfully initialized from the DocumentSnapshot.
                        print("City: \(city)")
                        self.user = city
                    } else {
                        // A nil value was successfully initialized from the DocumentSnapshot,
                        // or the DocumentSnapshot was nil.
                        print("Document does not exist" + city.debugDescription)
                    }
                case let .failure(error):
                    // A `City` value could not be initialized from the DocumentSnapshot.
                    print("Error decoding city: \(error)")
                }
            }
    }

    // Temp
    func addBook(book: User) {
        do {
            try db.collection("books").addDocument(from: book)
        } catch {
            print(error)
        }
    }
}
