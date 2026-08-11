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

struct StartTab: View {
    var body: some View {
        TabView {
            Tab("Alerts", systemImage: "exclamationmark.bubble") {
                AlertExamples()
            }

            Tab("Dialogs", systemImage: "questionmark.bubble") {
                ConfirmationDialogExamples()
            }

            Tab("Enum Alerts", systemImage: "list.bullet.rectangle") {
                EnumDrivenAlertExamples()
            }
        }
    }
}

#Preview {
    StartTab()
}
