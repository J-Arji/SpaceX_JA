//
//  MissonDetailView.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/23/24.
//

import UIKit

class MissonDetailView: UIViewController {
    
    //MARK: - properties
    private lazy var totalStackView: UIStackView = {
        var hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .vertical
        hStack.spacing = 8
        hStack.distribution = .fill
        hStack.alignment = .top
        return hStack
    }()
    
    private lazy var bookmarkButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bookmark.circle"), for: .normal)
        button.setImage(UIImage(systemName: "bookmark.circle"), for: .selected)
        button.tintColor = .systemBlue
        return button
    }()
    
    private lazy var imageViwe: UIImageView = {
        var view = UIImageView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleStackView: UIStackView = {
        var vStack = UIStackView()
        vStack.axis = .vertical
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.spacing = 2
        vStack.distribution = .equalCentering
        vStack.alignment = .fill
        return vStack
    }()
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
    private lazy var moreInfoButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "info.circle.fill"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()
    
    private lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var viewModel: MissionDetailViewModel
    
    //MARK: - Initilazer
    init(_ viewModel: MissionDetailViewModel) {
        
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        applayTheme()
        setText()
        bindViewModel()
        viewModel.loadSubject.send(())
    }
    
    
    //MARK: - setup
    private func setupLayout() {
        view.addSubview(totalStackView)
        totalStackView.addArrangedSubview(imageViwe)
        totalStackView.addArrangedSubview(titleStackView)
        totalStackView.addArrangedSubview(descriptionLabel)
        totalStackView.addArrangedSubview(dateLabel)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(moreInfoButton)
        view.addSubview(bookmarkButton)
        
        NSLayoutConstraint.activate([
            totalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            totalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            totalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            totalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 8),
            imageViwe.widthAnchor.constraint(equalTo: totalStackView.widthAnchor, multiplier: 1),
            imageViwe.heightAnchor.constraint(equalToConstant: 250),
            titleStackView.heightAnchor.constraint(equalToConstant: 30),
            dateLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            bookmarkButton.widthAnchor.constraint(equalToConstant: 30),
            bookmarkButton.heightAnchor.constraint(equalTo: bookmarkButton.widthAnchor, multiplier: 1),
            bookmarkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            bookmarkButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
    
    private func applayTheme() {
        view.backgroundColor = .white
    }
    
    private func setText() {
        
    }
    
    
    //MARK: - bind
    private func bindViewModel() {
        viewModel.
    }
    
    
    //MARK: - Action
}
