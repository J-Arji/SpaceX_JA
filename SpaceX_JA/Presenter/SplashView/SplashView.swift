//
//  SplashView.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/22/24.
//

import UIKit

class SplashView: UIViewController {
    
    //MARK: - properties
    let activityIndicator: UIActivityIndicatorView = {
        var view =  UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.style = .large
        view.hidesWhenStopped = true
        view.tintColor = .gray
        return view
    }()
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupView()
        bindMonitoring()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindMonitoring()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - setup view
    func setupView() {
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        activityIndicator.startAnimating()
    }
    
    //MARK: - bind Data
    func bindMonitoring() {
        NetworkMonitor.shared.startMonitoring()
        NotificationCenter.default.addObserver(self, selector: #selector(networkStatus(notification:)), name: .connectivityStatus, object: nil)
    }
    
    
    //MARK: - Action
    @objc private func networkStatus(notification: Notification) {
        if !NetworkMonitor.shared.isConnected { return }
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as? SceneDelegate else { return }
            sceneDelegate.changeFlow(to: .main)
        }
        
    }
}

