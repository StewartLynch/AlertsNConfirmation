//
//----------------------------------------------
// Original project: AlertsNConfirmation
// by  Stewart Lynch on 2026-08-10
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2026 CreaTECH Solutions. All rights reserved.


import SwiftUI

struct AlertExamples: View {
  @State private var lastAction = "No action selected"
  
  var body: some View {
    NavigationStack {
      List {
        Section {
          Button("The Old Way") {
            
          }
          Button("Item Binding") {
            
          }
          Button("Item Binding with Message") {
            
          }
          Button("Error Binding") {
            
          }
          Button("Error Binding with Message") {
            
          }
        } footer: {
          Text("Each presentation is driven by one optional value. SwiftUI unwraps it for the alert and resets it to nil on dismissal.")
        }
        
        Section("Last Action") {
          Text(lastAction)
            .foregroundStyle(.secondary)
        }
      }
      .navigationTitle("Alerts")
    }
  }
}

#Preview {
  AlertExamples()
}
