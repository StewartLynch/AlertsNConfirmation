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
  @State private var selectedProject: Project?
  @State private var itemBindingWithMessage: Project?
  @State private var errorAlert: SaveError?
  @State private var errorAlertWithMessage: SaveError?
  @State private var isShowingAlert = false
  
  var body: some View {
    NavigationStack {
      List {
        Section {
          Button("The Old Way") {
            selectedProject = .websiteRedesign
            isShowingAlert = true
          }
          Button("Item Binding") {
            selectedProject = .websiteRedesign
          }
          Button("Item Binding with Message") {
            itemBindingWithMessage = .launchAssets
          }
          Button("Error Binding") {
            errorAlert = .offline
          }
          Button("Error Binding with Message") {
            errorAlertWithMessage = .serverRejected(code: 503)
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
      .alert(
        "Archive Project",
        isPresented: $isShowingAlert) {
          Button("Archive") {
            guard let selectedProject else { return }
            // archive project
            lastAction = "Archived \(selectedProject.name)"
          }
          Button(role: .cancel) {}
        }
        .alert(
          "Archive Project",
          item: $selectedProject) { selectedProject in
            Button("Archive") {
              // archive project
              lastAction = "Archived \(selectedProject.name)"
            }
            Button(role: .cancel) {}
          }
          .alert(
            "Delete Project?",
            item: $itemBindingWithMessage) { project in
              Button(role: .destructive) {
                // delete project
                lastAction = "Deleted \(project.name)"
              }
              Button(role: .cancel) {}
            } message: { project in
              Text("\(project.name) amd its \(project.fileCount) files will be permanently deleted!")
            }
            .alert(
              error: $errorAlert) {
                Button("OK") {
                  lastAction = "Dismissed the save error"
                }
              }
              .alert(
                error: $errorAlertWithMessage) { error in
                  Button("Try again") {
                    lastAction = "Retried after error \(error.code)"
                  }
                  Button(role: .cancel) {}
                } message: { error in
                  Text(error.recoverySuggestion ?? "Please try again")
                }


    }
  }
}

#Preview {
  AlertExamples()
}
