//
//  MissionCell.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/22/24.
//

import UIKit

class MissionCell: UITableViewCell {
    
    let margin = 8.0

    //MARK: - Properties
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var gradientView: GradientView = {
        var view = GradientView()
        view.translatesAutoresizingMaskIntoConstraints = false 
        return view
    }()
    
    private lazy var totalStackView: UIStackView = {
        var vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.spacing = 4
        vStack.distribution = .fill
        vStack.alignment = .fill
        return vStack
    }()
    
    private lazy var headerStackView: UIStackView = {
        var hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        hStack.spacing = margin
        hStack.distribution = .fill
        hStack.alignment = .fill
        return hStack
    }()
    
    //MARK: - initilazer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupLayout()
        applaytheme()
    }
    
    //MARK: - setup
    private func applaytheme() {
        numberLabel.font = .systemFont(ofSize: 15, weight: .heavy)
        descriptionLabel.font = .systemFont(ofSize: 10, weight: .thin)
        statusLabel.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    private func setupLayout() {
        self.contentView.addSubview(icon)
        self.contentView.addSubview(gradientView)
        /// icon
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
            icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin),
            icon.heightAnchor.constraint(equalToConstant: 300)
        ])
        /// gradientView
        NSLayoutConstraint.activate([
            gradientView.bottomAnchor.constraint(equalTo: icon.bottomAnchor),
            gradientView.leadingAnchor.constraint(equalTo: icon.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: icon.trailingAnchor),
            gradientView.heightAnchor.constraint(equalTo: icon.heightAnchor, multiplier: 0.4)
        ])
        
        /// totalStackView
        NSLayoutConstraint.activate([
            totalStackView.heightAnchor.constraint(equalTo: gradientView.heightAnchor),
            totalStackView.widthAnchor.constraint(equalTo: gradientView.widthAnchor),
            totalStackView.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor),
            totalStackView.centerYAnchor.constraint(equalTo: gradientView.centerYAnchor)
        ])
        
        totalStackView.addArrangedSubview(headerStackView)
        totalStackView.addArrangedSubview(descriptionLabel)
        headerStackView.addArrangedSubview(numberLabel)
        headerStackView.addArrangedSubview(statusLabel)
    }
     
    
    //MARK: - Set
    public func set(icon url: String?) {
        
    }
    
    public func set(status isSuccess: Bool) {
        statusLabel.text = isSuccess ? "Success" : "Fail"
        statusLabel.textColor = isSuccess ? .systemGreen : .systemRed
    }
    
    public func set(flight number: Int) {
        numberLabel.text = "\(number)"
    }
    
    public func set(description: String?) {
        descriptionLabel.text = description
    }
    
    
    //MARK: - prepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionLabel.text = ""
        numberLabel.text = ""
        statusLabel.text = ""
    }
}
