//
//  PickServerLoaderTableViewCell.swift
//  Mastodon
//
//  Created by MainasuK Cirno on 2021-5-13.
//

import UIKit
import Combine

final class PickServerLoaderTableViewCell: TimelineLoaderTableViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 10, right: 16)
        view.backgroundColor = Asset.Colors.Background.secondaryGroupedSystemBackground.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let seperator: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Colors.Background.systemGroupedBackground.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emptyStatusLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.Scene.ServerPicker.EmptyState.noResults
        label.textColor = Asset.Colors.Label.secondary.color
        label.textAlignment = .center
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: .systemFont(ofSize: 14, weight: .semibold), maximumPointSize: 19)
        return label
    }()
    
    override func _init() {
        super._init()
        
        contentView.addSubview(containerView)
        contentView.addSubview(seperator)

        NSLayoutConstraint.activate([
            // Set background view
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.readableContentGuide.leadingAnchor),
            contentView.readableContentGuide.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 1),
            
            // Set bottom separator
            seperator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: seperator.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: seperator.topAnchor),
            seperator.heightAnchor.constraint(equalToConstant: 1).priority(.defaultHigh),
        ])
        
        emptyStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(emptyStatusLabel)
        NSLayoutConstraint.activate([
            emptyStatusLabel.leadingAnchor.constraint(equalTo: containerView.readableContentGuide.leadingAnchor),
            containerView.readableContentGuide.trailingAnchor.constraint(equalTo: emptyStatusLabel.trailingAnchor),
            emptyStatusLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
        emptyStatusLabel.isHidden = true
        
        contentView.bringSubviewToFront(stackView)
        activityIndicatorView.isHidden = false
        startAnimating()
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct PickServerLoaderTableViewCell_Previews: PreviewProvider {
    
    static var previews: some View {
        UIViewPreview(width: 375) {
            PickServerLoaderTableViewCell()
        }
        .previewLayout(.fixed(width: 375, height: 100))
    }
    
}

#endif