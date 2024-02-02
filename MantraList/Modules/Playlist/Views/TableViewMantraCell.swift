//
//  TableViewMantraCell.swift
//  MantraList
//
//  Created by Evgeniy Goncharov on 02.02.2024.
//

import UIKit

final class TableViewMantraCell: UITableViewCell {
    
    // MARK: - Properties
    private lazy var containerView = UIView().apply {
        $0.backgroundColor = AppColors.buttomMantra
        $0.layer.cornerRadius = 22
    }
    
    private var playButton = UIButton().apply {
        $0.setImage(UIImage(named: "play")?.withTintColor(AppColors.white), for: .normal)
    }
    
    private var name = UILabel().apply {
        $0.font = UIFont(name: Fonts.peachi, size: 15)
        $0.textAlignment = .left
        $0.textColor = AppColors.white
    }
    
    private var duration = UILabel().apply {
        $0.font = UIFont(name: Fonts.nunito, size: 12)
        $0.textAlignment = .right
        $0.textColor = AppColors.white.withAlphaComponent(0.4)
    }
    
    // MARK: - Inherited Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ item: MantraModel) {
        name.text = item.name
        duration.text = item.duration.secondsToMinute()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        [playButton, name, duration].forEach {
            containerView.addSubview($0)
        }
        addSubview(containerView)
        
        self.backgroundColor = AppColors.clear
        
        let view = UIView()
        view.backgroundColor = self.backgroundColor
        self.selectedBackgroundView = view
    }
    
    private func layout() {
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.left.right.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(4)
        }
        
        playButton.snp.makeConstraints {
            $0.centerY.equalTo(containerView)
            $0.left.equalToSuperview().inset(19)
            $0.size.equalTo(24)
        }
        
        name.snp.makeConstraints {
            $0.centerY.equalTo(containerView)
            $0.left.equalTo(playButton.snp.rightMargin).offset(25)
        }
        
        duration.snp.makeConstraints {
            $0.centerY.equalTo(containerView)
            $0.right.equalToSuperview().inset(25)
            $0.height.equalTo(32)
        }
    }
}
