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

struct EnumDrivenAlertExamples: View {
  @State private var lastAction = "No action selected"
  @State private var alertDestination: AlertDestination?
  
  var body: some View {
    NavigationStack {
      List {
        Section {
          Button("Archive Project") {
            alertDestination = .archive(.websiteRedesign) {
              lastAction = "Archived Website Redesign from the enum alert"
            }
          }
          Button("Delete Project") {
            alertDestination = .delete(.launchAssets) {
              lastAction = "Deleted launch assets from the enum alert"
            }
          }
          Button("Save Project") {
            alertDestination = .saveFailed(.serverRejected(code: 503)) {
              lastAction = "Retried after enum error 503"
            }
          }
        } footer: {
          Text("This mirrors the enum sheet pattern: one optional Identifiable enum models every destination, and its View body supplies the alert actions.")
        }
        
        Section("Last Action") {
          Text(lastAction)
            .foregroundStyle(.secondary)
        }
      }
      .navigationTitle("Enum-Driven Alerts")
      .alert("Project Action", item: $alertDestination) {
        $0
      } message: {
        $0.message
      }

    }
  }
}

#Preview {
  EnumDrivenAlertExamples()
}
