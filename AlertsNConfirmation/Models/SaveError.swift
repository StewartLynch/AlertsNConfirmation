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


import Foundation

enum SaveError: LocalizedError {
    case offline
    case serverRejected(code: Int)

    var errorDescription: String? {
        switch self {
        case .offline:
            "Unable to Save"
        case .serverRejected:
            "Server Rejected the Save"
        }
    }

    var recoverySuggestion: String? {
        switch self {
        case .offline:
            "Check your internet connection and try again."
        case .serverRejected(let code):
            "The server returned error \(code). Please try again in a moment."
        }
    }

    var code: Int {
        switch self {
        case .offline:
            0
        case .serverRejected(let code):
            code
        }
    }
}
