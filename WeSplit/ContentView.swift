//
//  ContentView.swift
//  WeSplit
//
//  Created by vefa kosova on 12.04.2023.
//

import SwiftUI

struct ContentView: View {
//3    @State private var tapCount = 0
    
//4    @State private var name = ""
    
//5    let students = ["Harry", "Hermione", "Ron"]
//    @State private var selectedStudent = "Harry"
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
//1        Form {
//            Section {
//                Text("Hello, world!")
//                Text("Hello, world!")
//            }
//            Group {
//                Text("Hello, world!")
//                Text("Hello, world!")
//            }
//        }
   
        
//2        NavigationView {
//            Form {
//                Section {
//                    Text("Hello, world")
//                }
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.inline)
//        }
        
        
//3        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//        }
        
        
//4        Form {
//            TextField("Enter your name", text: $name)
//            Text("Your name is \(name)")
//        }
        
        
//5        Form {
//            ForEach(0..<100) {
//                Text("Row \($0)")
//            }
//        }
        
//5        NavigationView {
//            Form {
//                Picker("select your student", selection:
//                        $selectedStudent) {
//                        ForEach(students, id: \.self) {
//                            Text($0)
//                        }
//                    }
//                }
//            }
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format:
                            .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    Picker("Number of people",   selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format:
                            .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount for one person")
                }
            }
            .navigationTitle("WeSplit ")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
