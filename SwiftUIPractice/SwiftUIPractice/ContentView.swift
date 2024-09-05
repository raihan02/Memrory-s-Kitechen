//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Raihan on 13/7/24.
//

import SwiftUI
import SwiftData
import UIKit
struct ContentView: View {
   
    @Query var personList: [Person]
    var people: [Person] = []
    @Environment(\.modelContext) var modelContext
    @State private var path = [Person]()
    var sortedPerson: [Person] {
           return personList.sorted(by: { $0.orderDate < $1.orderDate })
       }
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(sortedPerson
                ) { person in
                    if !person.cakeName.isEmpty && person.orderDate.timeIntervalSince1970 > 0  {
                        NavigationLink(value: person) {
                            HStack {
                                Text(person.cakeName)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                Spacer()
                                Text(self.formatDate(date: person.orderDate))
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                    
                            }
                        }
                      
                        
                    }
                    
                }
            }
            .navigationTitle("Memory's Kitchen")
            .navigationDestination(for:  Person.self) { person in
                EditPersonView.init(person: person, dateString: formatDate(date: person.orderDate))
                
            }
            .toolbar {
                Button("Add Customer", systemImage: "plus", action: addCustomer)
                Button("History", systemImage: "history", action: addCustomer)
            }
            
        }
        
    }
    
    func addCustomer() {
        let customer = Person(customerName: "", mobileNumber: "", orderAmount: "", deliveryCharge: "", cakeDetails: "",cakeName: "", orderDate: Date(), customerLocation: "")
        modelContext.insert(customer)
        path.append(customer)
    }
    
    func formatDate(date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: date)
        }
    
  
}

#Preview {
    ContentView()
}
