//
//  EGMSDeviceViewController.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import UIKit

class EGMSDeviceViewController: UIViewController {
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
        let scanButton = UIButton()
        let terminalTableView = UITableView()
        
        view.addSubview(scanButton)
        view.addSubview(terminalTableView)
        
        self.scanButton = scanButton
        self.terminalTableView = terminalTableView
    }
    
    private func configureEGMSDeviceSubviews() {
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
    
    @objc private func scanTapped() {
        viewModel.toggleScan()
    }
}

extension EGMSDeviceViewController: EGMSDeviceViewInput {
}

extension EGMSDeviceViewController: EGMSDeviceViewModelOutput {
    func show(connected: Bool) {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "terminalCellId") as! EGMSTerminalTableViewCell
        let terminalViewModel = terminalViewModels[indexPath.row]
        cell.configureCell(with: terminalViewModel)
        return cell
    }
}

extension EGMSDeviceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
}
