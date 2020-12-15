//
//  ViewController.swift
//  BodyEmail
//
//  Created by Jordi Milla on 15/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import Foundation
import Moya

class BodyEmailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModelBodyEmail()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setTable()
        bind()
    }
    
    private func configureView() {
        viewModel.retriveDataBoduEMail()
    }
    
    private func bind() {
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
    
    func setTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "BodyEmailTableViewCell", bundle: nil), forCellReuseIdentifier: "BodyEmailTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BodyEmailTableViewCell" ) as? BodyEmailTableViewCell
        let bodyEmail = viewModel.dataArray[indexPath.row]
        cell?.configure(bodyEmail: bodyEmail)
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "OneBodyEmailViewController") as? OneBodyEmailViewController else { return }
        vc.id = viewModel.dataArray[indexPath.row].id
        navigationController?.pushViewController(vc, animated: true)
    }
    


}

