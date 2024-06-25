//
//  MissionCell.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/22/24.
//

import UIKit

class MissionCell: UITableViewCell {
    
    let margin = 16.0

    //MARK: - Properties
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private  lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()

    
    private lazy var totalStackView: UIStackView = {
        var hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        hStack.spacing = 8
        hStack.distribution = .fill
        hStack.alignment = .top
        return hStack
    }()

    
    private lazy var infoStackView: UIStackView = {
        var vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = margin/2
        vStack.distribution = .fill
        vStack.alignment = .fill
        return vStack
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
        descriptionLabel.font = .systemFont(ofSize: 11, weight: .thin)
        statusLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        dateLabel.font = .systemFont(ofSize: 9, weight: .light)
    }
    
    private func setupLayout() {
        self.contentView.addSubview(totalStackView)
        totalStackView.addArrangedSubview(iconImageView)
        totalStackView.addArrangedSubview(infoStackView)
        infoStackView.addArrangedSubview(numberLabel)
        infoStackView.addArrangedSubview(statusLabel)
        infoStackView.addArrangedSubview(descriptionLabel)
        infoStackView.addArrangedSubview(dateLabel)
        
        /// icon
        NSLayoutConstraint.activate([
            dateLabel.heightAnchor.constraint(equalToConstant: 15),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),
            numberLabel.heightAnchor.constraint(equalTo: statusLabel.heightAnchor, multiplier: 1),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor, multiplier: 1),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            totalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            totalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
            totalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
            totalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin),
            totalStackView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
     
    
    //MARK: - Set
    public func set(icon url: String?) {
        self.iconImageView.setRemoteImage(with: url, placeholder:  .Design.placeholderApp.cell)
    }
    
    public func set(status isSuccess: Bool) {
        statusLabel.text =  .labels( isSuccess ? .success : .faild)
        statusLabel.textColor = isSuccess ? .systemGreen : .systemRed
    }
    
    public func set(flight number: Int) {
        numberLabel.text = .labels(.number) + " \(number) "
    }
    
    public func set(description: String?) {
        descriptionLabel.text = description
    }
    
    public func set(date: String?) {
        dateLabel.text = date
    }
    
    
    //MARK: - prepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionLabel.text = ""
        numberLabel.text = ""
        statusLabel.text = ""
    }
}
