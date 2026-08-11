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

enum AlertDestination:  View {
    case archive(Project, action: () -> Void)
    case delete(Project, action: () -> Void)
    case saveFailed(SaveError, retryAction: () -> Void)

    var body: some View {
        switch self {
        case .archive(let project, let action):
            Button("Archive \(project.name)", action: action)
            Button("Cancel", role: .cancel) {}
        case .delete(_, let action):
            Button("Delete", role: .destructive, action: action)
            Button("Cancel", role: .cancel) {}
        case .saveFailed(_, let retryAction):
            Button("Try Again", action: retryAction)
            Button("Cancel", role: .cancel) {}
        }
    }

    var message: Text {
        switch self {
        case .archive(let project, _):
            Text("Move \(project.name) to the archive?")
        case .delete(let project, _):
            Text("\(project.name) and its \(project.fileCount) files will be permanently deleted.")
        case .saveFailed(let error, _):
            Text(error.recoverySuggestion ?? "Please try again.")
        }
    }
}

#Preview {
    AlertDestination.archive(.websiteRedesign) {}
}
