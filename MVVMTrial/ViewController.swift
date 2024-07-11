//
//  ViewController.swift
//  MVVMTrial
//
//  Created by Raj.P, Varun (Cognizant) on 11/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: BindingTextField!
    
    private var vm = LoginViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTF.bind { [weak self] text in
            self?.vm.name = text
        }
    }

    @IBAction func save() {
        
    }

    @IBAction func fetch() {
        
    }
}
