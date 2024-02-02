//
//  Int + Ext.swift
//  MantraList
//
//  Created by Evgeniy Goncharov on 03.02.2024.
//

import Foundation

extension Int {
    func secondsToMinute() -> String {
        let (m,s) = ((self % 3600) / 60, (self % 3600) % 60)
        let m_string =  m < 10 ? "0\(m)" : "\(m)"
        let s_string =  s < 10 ? "0\(s)" : "\(s)"
        return "\(m_string):\(s_string)"
    }
}
