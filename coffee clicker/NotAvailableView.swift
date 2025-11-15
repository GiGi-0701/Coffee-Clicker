//
//  NotAvailableView.swift
//  coffee clicker
//
//  Created by Giuseppe Mancuso on 19.10.25.
//

import SwiftUI

struct NotAvailableView: View {
    var body: some View {
        VStack {
            Image("error")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .padding(.bottom)
            Text("You haven't unlocked this page yet!")
        }
    }
}

#Preview {
    NotAvailableView()
}
