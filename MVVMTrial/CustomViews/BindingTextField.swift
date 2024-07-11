//
//  BindingTextField.swift
//  MVVMTrial
//
//  Created by Raj.P, Varun (Cognizant) on 11/07/24.
//

import Foundation
import UIKit

class Dynamic<T> {
    
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(callback: @escaping (T) -> Void) {
        listener = callback
    }
}

class BindingTextField: UITextField {
    
    var textChanged: (String) -> Void = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    func bind(callback: @escaping (String) -> Void) {
        textChanged = callback
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            print(text)
            textChanged(text)
        }
    }
}
