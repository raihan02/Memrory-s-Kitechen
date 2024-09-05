//
//  EditPersonView.swift
//  SwiftUIPractice
//
//  Created by Raihan on 13/7/24.
//

import SwiftUI
import SwiftData

struct EditPersonView: View {
    
    @Bindable var person: Person
    @State  var showDatePicker = false
    @State private var selectedDate = Date()
    @State  var dateString = ""
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section ("Customer Information") {
                TextField("Customer Name", text: $person.customerName)
                    .textContentType(.name)
                
                TextField("Customer Mobile Number", text: $person.mobileNumber)
                    .textContentType(.telephoneNumber)
                
                TextField("Csutomer Location", text: $person.customerLocation, axis: .vertical)
                    .textContentType(.name)
            }
            
            Section("Cake Information") {
                
                TextField("Cake Type", text: $person.cakeName)
                    .textContentType(.name)
                
                TextField("Cake Details", text: $person.cakeDetails, axis: .vertical)
                    .textContentType(.name)
                TextField("Order Date", text: $dateString)
                    .onTapGesture {
                        self.showDatePicker.toggle()
                    }
                
                if showDatePicker {
                    VStack {
                        DatePicker(
                            "Select Date",
                            selection: $person.orderDate,
                            displayedComponents: .date
                        )
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .labelsHidden()
                        .padding()
                        Button("Done") {
                            dateString = formatDate(date: person.orderDate)
                            showDatePicker = false
                        }
                        .padding()
                    }
                    
                }
                
            }
            
            Section ("Order Information") {
                TextField("Cake Price", text: $person.orderAmount)
                    .textContentType(.telephoneNumber)
                
                TextField("Delivery Charge", text: $person.deliveryCharge)
                    .textContentType(.telephoneNumber)
            }
            
            Button(action: {
                if !person.cakeName.isEmpty {
                    presentationMode.wrappedValue.dismiss()
                } else {
                    showAlert = true
                }
            }) {
                Text("Save")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    
            }
            .background(Color.black)
            .cornerRadius(8)
            .frame(maxWidth: .infinity, maxHeight: 60)
            
        }.navigationTitle("Detail")
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Save Denied"),
                    message: Text("You must put input for cake type."),
                    dismissButton: .default(Text("OK"))
                )
            }
    }
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

//#Preview {
//    EditPersonView()
//}
