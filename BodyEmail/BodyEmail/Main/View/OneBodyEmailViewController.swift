//
//  OneBodyEmailViewController.swift
//  BodyEmail
//
//  Created by Jordi Milla on 15/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit

class OneBodyEmailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var id: Int?
    var viewModelOneBodyEmail = ViewModelOneBodyEmail()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        updateLabel()
        bind()
    }
    
    private func configureView() {
        guard let id = self.id else { return }
        viewModelOneBodyEmail.requestBodyEmailById(id: id)
    }
    
    private func bind() {
        viewModelOneBodyEmail.refreshDataOneBodyEmail = { [weak self] () in
            DispatchQueue.main.async {
                self?.updateLabel()
            }
        }
    }
    
    func updateLabel() {
        nameLabel.text = viewModelOneBodyEmail.dataOneBodyEmail.name
        emailLabel.text = viewModelOneBodyEmail.dataOneBodyEmail.email
        bodyLabel.text = viewModelOneBodyEmail.dataOneBodyEmail.body
    }
}
