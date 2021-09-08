//
//  EGMSDeviceViewController.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import UIKit

class EGMSDeviceViewController: UIViewController {
    weak var connectionPendingLabel: UILabel!
    weak var disconnectButton: UIButton!
    weak var scanButton: UIButton!
    weak var terminalTableView: UITableView!
    var terminalViewModels = [EGMSTerminalViewModel]()
    var viewModel: EGMSDeviceViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .egmsBlue
        
        addEGMSDeviceSubviews()
        configureEGMSDeviceSubviews()
        constrainEGMSDeviceSubviews()
    }
    
    private func addEGMSDeviceSubviews() {
        let connectionPendingView = UILabel()
        let disconnectButton = UIButton()
        let scanButton = UIButton()
        let terminalTableView = UITableView()
        
        view.addSubview(connectionPendingView)
        view.addSubview(disconnectButton)
        view.addSubview(scanButton)
        view.addSubview(terminalTableView)
        view.bringSubviewToFront(connectionPendingView)
        
        self.connectionPendingLabel = connectionPendingView
        self.disconnectButton = disconnectButton
        self.scanButton = scanButton
        self.terminalTableView = terminalTableView
    }
    
    private func configureEGMSDeviceSubviews() {
        connectionPendingLabel.backgroundColor = .egmsDarkGreen
        connectionPendingLabel.isHidden = true
        connectionPendingLabel.text = "Connecting..."
        connectionPendingLabel.textAlignment = .center
        connectionPendingLabel.textColor = .egmsLightGreen
        connectionPendingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        disconnectButton.addTarget(self, action: #selector(disconnectTapped), for: .touchUpInside)
        disconnectButton.backgroundColor = .egmsOrange
        disconnectButton.setTitle("Disconnect", for: .normal)
        disconnectButton.setTitleColor(.white, for: .normal)
        disconnectButton.translatesAutoresizingMaskIntoConstraints = false
        show(connected: false)
        
        scanButton.addTarget(self, action: #selector(scanTapped), for: .touchUpInside)
        scanButton.backgroundColor = .egmsGreen
        scanButton.setTitleColor(.white, for: .normal)
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        show(scanning: false)
        
        terminalTableView.backgroundColor = .clear
        terminalTableView.dataSource = self
        terminalTableView.delegate = self
        terminalTableView.register(EGMSTerminalTableViewCell.self, forCellReuseIdentifier: "terminalCellId")
        terminalTableView.separatorStyle = .none
        terminalTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func constrainEGMSDeviceSubviews() {
        connectionPendingLabel.pin(to: view)
        disconnectButton.pin(to: scanButton)
        
        NSLayoutConstraint.activate([
            scanButton.heightAnchor.constraint(equalToConstant: 54),
            scanButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            scanButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            scanButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            terminalTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            terminalTableView.leftAnchor.constraint(equalTo: scanButton.leftAnchor),
            terminalTableView.rightAnchor.constraint(equalTo: scanButton.rightAnchor),
            terminalTableView.topAnchor.constraint(equalTo: scanButton.bottomAnchor, constant: 16),
        ])
    }
    
    @objc private func disconnectTapped() {
        viewModel.disconnect()
    }
    
    @objc private func scanTapped() {
        viewModel.toggleScan()
    }
}

extension EGMSDeviceViewController: EGMSDeviceViewInput {
}

extension EGMSDeviceViewController: EGMSDeviceViewModelOutput {
    func show(connected: Bool) {
        disconnectButton.isHidden = !connected
        scanButton.isHidden = connected
        terminalTableView.isHidden = connected
    }
    
    func show(connecting: Bool) {
        connectionPendingLabel.isHidden = !connecting
    }
    
    func show(error: Error) {
    }
    
    func show(scanning: Bool) {
        let buttonTitle = scanning ? "Stop Scanning" : "Scan for Devices"
        scanButton.setTitle(buttonTitle, for: .normal)
    }
    
    func show(terminalViewModels: [EGMSTerminalViewModel]) {
        self.terminalViewModels = terminalViewModels
        terminalTableView.reloadData()
    }
}

extension EGMSDeviceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        terminalViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = EGMSTerminalTableViewCell(style: .value1, reuseIdentifier: "terminalCellId")
        let terminalViewModel = terminalViewModels[indexPath.row]
        cell.configureCell(with: terminalViewModel)
        return cell
    }
}

extension EGMSDeviceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let terminalViewModel = terminalViewModels[indexPath.row]
        viewModel.didSelect(terminalWithId: terminalViewModel.identifier)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
}
