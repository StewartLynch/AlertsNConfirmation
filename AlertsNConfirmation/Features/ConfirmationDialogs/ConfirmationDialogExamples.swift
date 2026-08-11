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
  @State private var itemDialogWithMessage: Project?
  @State private var itemDialog: Project?
  
  var body: some View {
    NavigationStack {
      List {
        Section {
          Button("Item Binding with Message") {
            itemDialogWithMessage = .launchAssets
          }
          .confirmationDialog(
            "Delete Project?",
            item: $itemDialogWithMessage) { project in
              Button(role: .destructive) {
                lastAction = "Deleted \(project.name) from the dialog"
              }
              Button(role: .cancel) {}
            } message: { project in
              Text("This removes \(project.name) and all \(project.fileCount) files.")
            }
          
          Button("Choose Project Destination") {
            itemDialog = .websiteRedesign
          }
          .confirmationDialog(
            "Move project",
            item: $itemDialog,
            titleVisibility: .visible) { project in
              Button("Move to favourites") {
                lastAction = "Moved \(project.name) to Favourites"
              }
              Button("Move to In Progress") {
                lastAction = "Moved \(project.name) to In Progress"
              }
              Button("Move to Completed") {
                lastAction = "Moved \(project.name) to Completed"
              }
              Button("Move to Archive") {
                lastAction = "Moved \(project.name) to Archive"
              }
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
