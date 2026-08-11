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

struct ConfirmationDialogExamples: View {
  @State private var lastAction = "No action selected"
  
  var body: some View {
    NavigationStack {
      List {
        Section {
          Button("Item Binding with Message") {
            
          }
          
          
          Button("Choose Project Destination") {
            
          }
        } footer: {
          Text("Confirmation dialogs gain the same item-binding presentation pattern in iOS 27 and can offer more than the two actions appropriate for an alert.")
        }
        
        Section("Last Action") {
          Text(lastAction)
            .foregroundStyle(.secondary)
        }
      }
      .navigationTitle("Confirmation Dialogs")
    }
  }
}

#Preview {
  ConfirmationDialogExamples()
}
