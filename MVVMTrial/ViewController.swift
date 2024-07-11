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
        
        vm.name.bind { [weak self] text in
            self?.nameTF.text = text
        }
        
        nameTF.bind { [weak self] text in
            print(text)
            self?.vm.name.value = text
        }
    }

    @IBAction func save() {
        print(vm.name.value)
    }

    @IBAction func fetch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.vm.name.value = "Varun"
        }
    }
}

