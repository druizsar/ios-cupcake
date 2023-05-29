//
//  ContentView.swift
//  Cupcake
//
//  Created by David Ruiz on 29/05/23.
//

import SwiftUI

// Main content view:

struct ContentView: View {
    // Properties:
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                // Type and quantity:
                Section {
                    Picker("Select you cake type", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                // Extra options:
                Section {
                    Toggle("Any special requests?", isOn: $order.sprecialRequestEnabbled.animation())
                    
                    if order.sprecialRequestEnabbled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                // Delivery:
                Section {
                    NavigationLink {
                        AdressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
                
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
