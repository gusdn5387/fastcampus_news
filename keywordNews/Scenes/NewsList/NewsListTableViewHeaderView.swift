//
//  NewsListTableViewHeaderView.swift
//  keywordNews
//
//  Created by Byapps on 2022/01/11.
//

import UIKit
import SnapKit
import TTGTags

final class NewsListTableViewHeaderView: UITableViewHeaderFooterView {
    static let identifier = "NewsListTableViewHeaderView"
    
    private var tags: [String] = ["주식", "코로나", "잔여백신", "부동산", "IT", "월드컵", "게임", "아이폰", "스타트업", "성수동"]
    
    private lazy var tagCollectionView = TTGTextTagCollectionView()
    
    func setup() {
        contentView.backgroundColor = .systemBackground
        
        setupTagCollectionViewLayout()
        setupTagCollectionView()
    }
}

extension NewsListTableViewHeaderView: TTGTextTagCollectionViewDelegate {
    func textTagCollectionView(_ textTagCollectionView: TTGTextTagCollectionView!, didTap tag: TTGTextTag!, at index: UInt) {
        guard tag.selected else { return }
        
        print(tags[Int(index)])
    }
}

private extension NewsListTableViewHeaderView {
    func setupTagCollectionViewLayout() {
        addSubview(tagCollectionView)
        
        tagCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupTagCollectionView() {
        let insetValue: CGFloat = 16.0
        let style = TTGTextTagStyle()
        style.backgroundColor = .systemOrange
        style.cornerRadius = 12.0
        style.borderWidth = 0.0
        style.shadowOpacity = 0.0
        style.extraSpace = CGSize(width: 20.0, height: 12.0)
        
        let selectedStyle = TTGTextTagStyle()
        selectedStyle.backgroundColor = .white
        selectedStyle.cornerRadius = 12.0
        selectedStyle.shadowOpacity = 0.0
        selectedStyle.extraSpace = CGSize(width: 20.0, height: 12.0)
        selectedStyle.borderColor = .systemOrange
        
        tagCollectionView.delegate = self
        tagCollectionView.numberOfLines = 1
        tagCollectionView.selectionLimit = 1
        tagCollectionView.scrollDirection = .horizontal
        tagCollectionView.showsHorizontalScrollIndicator = false
        tagCollectionView.contentInset = UIEdgeInsets(top: insetValue, left: insetValue, bottom: insetValue, right: insetValue)
        
        tags.forEach {
            let tagContents = TTGTextTagStringContent(text: $0, textFont: .systemFont(ofSize: 14.0, weight: .semibold), textColor: .white)
            let selectedTagContents = TTGTextTagStringContent(text: $0, textFont: .systemFont(ofSize: 14.0, weight: .semibold), textColor: .systemOrange)
            
            let tag = TTGTextTag(content: tagContents, style: style, selectedContent: selectedTagContents, selectedStyle: selectedStyle)
            
            tagCollectionView.addTag(tag)
        }
    }
}
