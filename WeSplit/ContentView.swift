//
//  ContentView.swift
//  WeSplit
//
//  Created by Logan Crisp on 10/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipAmount = 0.0
    @State private var tipPercent = 0
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 1)
        let tipSelection = Double(tipPercent)
        
        let tipVal = checkAmount * (tipSelection / 100)
        let total = checkAmount + tipVal
        return peopleCount > 0 ? (total / peopleCount) : 0.0
    }
    
    var totalAndTip: Double {
        let tipSelection = Double(tipPercent)
        let tipVal = checkAmount * (tipSelection / 100)
        let total = checkAmount + tipVal
        return total
    }


    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Enter Check Amount:")) {
                    TextField("Amount", value: $checkAmount, format: .currency(code:Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section(header: Text("Number of People")) {
                    Picker("Number of people: ", selection: $numberOfPeople) {
                        ForEach(1..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage: ", selection: $tipPercent) {
                        ForEach(0..<100) {
                            Text(($0), format: .percent)
                        }
                    }
                    .background((tipPercent == 0) ? .red.opacity(0.3) : .white)
                }
                Section(header: Text("TOTAL + TIP:")) {
                    Text(totalAndTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section(header: Text("AMOUNT PER PERSON:")) {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }

            }
            
            .navigationTitle("WeSplit")
        }
    }
}


#Preview {
    ContentView()
}
