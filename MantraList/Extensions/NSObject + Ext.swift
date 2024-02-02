//
//  NSObject + Ext.swift
//  MantraList
//
//  Created by Evgeniy Goncharov on 02.02.2024.
//

import Foundation

extension NSObjectProtocol {
    @discardableResult
    func apply(_ closure: (Self) -> () ) -> Self {
        { closure(self) }()
        return self
    }
}
