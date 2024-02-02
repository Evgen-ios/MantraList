//
//  MainViewController.swift
//  MantraList
//
//  Created by Evgeniy Goncharov on 02.02.2024.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var button = UIButton().apply {
        $0.titleLabel?.font =  UIFont(name: Fonts.nunito, size: 16)
        $0.setTitle(Localizable.MainView.title, for: .normal)
        $0.layer.cornerRadius = 22
        $0.backgroundColor = AppColors.purpure
        $0.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }
    
    // MARK: - Inherited Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTheme()
        setupViews()
        layout()
    }
    
    // MARK: - Private Methods
    private func configureTheme() {
        view.backgroundColor = AppColors.background
    }
    
    private func setupViews() {
        view.addSubview(button)
    }
    
    private func layout() {
        button.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.right.left.equalToSuperview().inset(16)
            $0.height.equalTo(62)
        }
    }
    
    @objc func pressed() {
        let viewControllerToPresent = PlaylistViewController()
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.preferredCornerRadius = 26
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
}

