//
//  loginView.swift
//  loginView
//
//  Created by Oybek on 7/31/21.
//

import UIKit

class LoginView: UIView {
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Properties
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // MARK: - Functions
    private func setupUI() {
        // style
        backgroundColor = .systemGray5
        // subviews
        addSubview(label)
        // constraints
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

