//
//  PlaylistViewController.swift
//  MantraList
//
//  Created by Evgeniy Goncharov on 02.02.2024.
//

import UIKit
import SnapKit

class PlaylistViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var items = getMantra()
    
    private var header = UILabel().apply {
        $0.text = Localizable.PlaylistView.title
        $0.font = UIFont(name: Fonts.peachi, size: 36)
        $0.textAlignment = .left
        $0.textColor = AppColors.white
    }
    
    private lazy var button = UIButton().apply {
        let mixImage = UIImage(named: "mix")?.withTintColor(AppColors.white)
        var configuration = UIButton.Configuration.filled()
        
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: Fonts.nunito, size: 16)
            return outgoing
        }
        
        configuration.title = Localizable.PlaylistView.mixButton
        configuration.image = mixImage
        configuration.imagePadding = 15
        configuration.background.backgroundColor = AppColors.clear
        $0.configuration = configuration
        
        $0.layer.borderWidth = 2.0
        $0.layer.borderColor = AppColors.white.withAlphaComponent(0.07).cgColor
        $0.layer.cornerRadius = 22
        
        $0.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }
    
    private lazy var tableView = UITableView().apply {
        $0.backgroundColor = .clear
        $0.clipsToBounds = true
        $0.dataSource = self
        $0.delegate = self
        $0.rowHeight = 70
        $0.registerCell(TableViewMantraCell.self)
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
        view.backgroundColor = AppColors.backgroundView
    }
    
    private func setupViews() {
        [header,tableView, button].forEach {
            view.addSubview($0)
        }
        
    }
    
    private func layout() {
        header.snp.makeConstraints{
            $0.top.equalToSuperview().inset(26)
            $0.right.left.equalToSuperview().inset(16)
            $0.height.equalTo(62)
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(header.snp_bottomMargin).offset(26)
            $0.right.left.equalToSuperview()
            $0.bottom.equalTo(button.snp.top).inset(-8)
        }
        
        button.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(36)
            $0.right.left.equalToSuperview().inset(16)
            $0.height.equalTo(62)
        }
    }
    
    private func getMantra() -> MantraModels {
        guard let url = Bundle.main.url(forResource: "Mantras", withExtension: "plist") else { return [] }
        guard let data = try? Data(contentsOf: url) else { return [] }
        
        var models: MantraModels?
        let decoder = PropertyListDecoder()
        models = try? decoder.decode(MantraModels.self, from: data)
        return models ?? []
    }
    
    @objc func pressed() {
        items.shuffle()
        
        UIView.transition(with: tableView,
                          duration: 0.35,
                          options: .transitionFlipFromTop,
                          animations: {
            self.tableView.reloadData()
        })
    }
    
}

// MARK: - Extension
extension PlaylistViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TableViewMantraCell = tableView.cell(forRowAt: indexPath) else { return UITableViewCell() }
        cell.configure(items[indexPath.section])
        cell.clipsToBounds = true
        return cell
    }
}
