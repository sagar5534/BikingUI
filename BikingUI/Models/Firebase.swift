//
//  Firebase.swift
//  BikingUI
//
//  Created by Sagar on 2020-09-23.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseManager: ObservableObject {
    @Published var data = [Test]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("users").addSnapshotListener { qu, _ in
            
            guard let docs = qu?.documents else {
                print("No Docs")
                return
            }
            
            self.data = docs.map { (QueryDocumentSnapshot) -> Test in
                let data = QueryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                print(name)
                return Test(name: name)
            }
        }
    }
}
