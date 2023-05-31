//
//  NavigationLinkAndDestinationView.swift
//  NavigationCrashCourseSwiftUI
//
//  Created by Maciej on 31/05/2023.
//

import SwiftUI

struct CustomerView: View {
    let customer: Customer
    
    init(_ customer: Customer) {
        self.customer = customer
    }
    
    var body: some View {
        VStack {
            Text(customer.name)
                .font(.headline)
            
            Text("\(customer.id)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
        }
    }
}

struct Customer: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct NavigationLinkAndDestinationView: View {
    let customers: [Customer] = [
        .init(name: "Dre"), .init(name: "Snoop"), .init(name: "Em")
    ]
    
    var body: some View {
        NavigationStack {
            List(customers) { customer in
                NavigationLink(customer.name, value: customer)
            }
            .navigationDestination(for: Customer.self) { customer in
                CustomerView(customer)
            }
        }
    }
}

struct NavigationLinkAndDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkAndDestinationView()
    }
}
