//
//  MissionDetailView.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/23/24.
//

import UIKit
import Combine


class MissionDetailView: UIViewController {
    
    //MARK: - properties
    private lazy var totalStackView: UIStackView = {
        var vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.distribution = .fill
        vStack.alignment = .top
        return vStack
    }()
    
    private lazy var bookmarkButton: UIButton = {
        var button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemBlue
        return button
    }()
    
    private lazy var imageViwe: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleStackView: UIStackView = {
        var hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.distribution = .equalSpacing
        hStack.alignment = .fill
        return hStack
    }()
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
    private lazy var moreInfoButton: UIButton = {
        var button = UIButton()
        button.setImage( .Design.Button.info, for: .normal)
        button.tintColor = .systemBlue
        return button
    }()
    
    private lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .justified
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    private var viewModel: MissionDetailViewModel
    private var cancellables = Set<AnyCancellable>()

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
        setupView()
        bindViewModel()
        viewModel.updateUI()
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
            
            imageViwe.widthAnchor.constraint(equalTo: totalStackView.widthAnchor, multiplier: 1),
            imageViwe.heightAnchor.constraint(equalToConstant: 250),
            
            titleStackView.heightAnchor.constraint(equalToConstant: 30),
            titleStackView.widthAnchor.constraint(equalTo: totalStackView.widthAnchor, multiplier: 1),
            dateLabel.widthAnchor.constraint(equalTo: totalStackView.widthAnchor, multiplier: 1),
            dateLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            bookmarkButton.widthAnchor.constraint(equalToConstant: 30),
            bookmarkButton.heightAnchor.constraint(equalTo: bookmarkButton.widthAnchor, multiplier: 1),
            bookmarkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            bookmarkButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
    
    private func applayTheme() {
        view.backgroundColor = .white
        titleLabel.font = .Design.title
        descriptionLabel.font = .Design.Body
        dateLabel.font = .Design.caption
    }
    
    private func setupView() {
        moreInfoButton.addTarget(self, action: #selector(didTapMoreInfo), for: .touchUpInside)
        bookmarkButton.addTarget(self, action: #selector(didTapBookmark), for: .touchUpInside)
        bookmarkButton.setImage(.Design.Button.unselected, for: .normal)
        bookmarkButton.setImage(.Design.Button.selected, for: .selected)
    }
    
    private func updateBookmarkState(_ state: MissionDetailViewModel.State) {
        switch state {
        case .loading:
            bookmarkButton.loadState.startAnimating()
            
        case .error(_):
            bookmarkButton.loadState.stopAnimating()
            
        case .finished(let isAdded):
            bookmarkButton.loadState.stopAnimating()
            bookmarkButton.isSelected =  isAdded
        }
    }
    
    //MARK: - bind
    private func bindViewModel() {
        viewModel.$name
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .sink { [weak self] name in
                self?.titleLabel.text = name
            }
            .store(in: &cancellables)
        
        viewModel.$imageUrl
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .sink { [weak self] path in
                self?.imageViwe.setRemoteImage(with: path, placeholder: .Design.placeholderApp.view)
            }
            .store(in: &cancellables)
        
        viewModel.$isMarked
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .sink { [weak self] isSelected in
                self?.bookmarkButton.isSelected = isSelected
            }
            .store(in: &cancellables)
        
        viewModel.$isShowInfo
          .eraseToAnyPublisher()
          .assign(to: \.isHidden, on: moreInfoButton)
          .store(in: &cancellables)
        
        viewModel.$detail
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .sink { [weak self] detail in
                self?.descriptionLabel.text = detail
                self?.descriptionLabel.sizeToFit()
            }
            .store(in: &cancellables)
        
        viewModel.$name
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .sink { [weak self] name in
                self?.titleLabel.text = name
            }
            .store(in: &cancellables)
        
        viewModel.state
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                self?.updateBookmarkState(state)
            }
            .store(in: &cancellables)
        
        viewModel.$missionDate
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .sink { [weak self] date in
                self?.dateLabel.text = date
            }
            .store(in: &cancellables)
    }
    
    
    //MARK: - Action
    @objc private func didTapBookmark() {
        viewModel.didtapBookMark(isAdded: bookmarkButton.isSelected)
    }
    
    @objc private func didTapMoreInfo() {
        bookmarkButton.loadState.stopAnimating()
        guard let link = viewModel.wikiLink else { return }
        openURL(with: link, completion: nil)
    }
    
}


//MARK: - route
extension MissionDetailView: NavigationProtocol { }
