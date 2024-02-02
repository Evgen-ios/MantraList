//
//  Localizable.swift
//  MantraList
//
//  Created by Evgeniy Goncharov on 03.02.2024.
//

import Foundation

internal enum Localizable {
    
    internal enum MainView {
        /// Открыть список мантр
        internal static let title = tr("Localizable", "mainView.title")
    }
    
    internal enum PlaylistView {
        /// Список мантр
        internal static let title = tr("Localizable", "playlistView.title")
        /// Перемешать
        internal static let mixButton = tr("Localizable", "playlistView.mixButton")
    }
}

extension Localizable {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
