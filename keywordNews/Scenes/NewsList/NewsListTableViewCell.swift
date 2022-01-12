//
//  NewsListTableViewCell.swift
//  keywordNews
//
//  Created by Byapps on 2022/01/11.
//

import UIKit
import SnapKit

final class NewsListTableViewCell: UITableViewCell {
    static let identifier = "NewsListTableViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0, weight: .medium)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    func setup() {
        setupLayout()
        
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        
        titleLabel.text = "기사제목"
        descriptionLabel.text = "기사내용"
        dateLabel.text = "2022.01.11"
    }
}

private extension NewsListTableViewCell {
    func setupLayout() {
        [titleLabel, descriptionLabel, dateLabel].forEach { addSubview($0) }
        
        let verticalSpacing: CGFloat = 4.0
        let superViewInset: CGFloat = 16.0
        
        titleLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(superViewInset)
            make.trailing.equalToSuperview().inset(48.0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalTo(titleLabel.snp.trailing)
            make.top.equalTo(titleLabel.snp.bottom).offset(verticalSpacing)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalTo(titleLabel.snp.trailing)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(verticalSpacing)
            make.bottom.equalToSuperview().inset(superViewInset)
        }
    }
}
