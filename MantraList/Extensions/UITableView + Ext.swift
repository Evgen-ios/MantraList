//
//  UITableView + Ext.swift
//  MantraList
//
//  Created by Evgeniy Goncharov on 02.02.2024.
//

import UIKit

protocol ReusableCellIdentifiable {
    static var cellIdentifier: String { get }
}

extension UITableView {
    
    func register<T: UITableViewCell>(_ cellClass: T.Type, reuseIdentifier: String = .init(describing: T.self)) {
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func cell<T: ReusableCellIdentifiable>(forRowAt indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: T.cellIdentifier, for: indexPath) as? T
    }
    
    func registerCell<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass.self, forCellReuseIdentifier: cellClass.cellIdentifier)
    }
}

extension UITableViewCell: ReusableCellIdentifiable { }

extension ReusableCellIdentifiable where Self: UITableViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}
