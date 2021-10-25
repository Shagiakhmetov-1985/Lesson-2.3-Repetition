//
//  ViewController.swift
//  Lesson 2.3 Repetition
//
//  Created by Marat Shagiakhmetov on 24.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let user = "Marat"
    private let password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let enterVC = segue.destination as! EnterViewController
        enterVC.user = user
    }
    
    @IBAction func logInPressed() {
        if userTextField.text != user || passwordTextField.text != password {
            showAlert(
                title: "Invalid login or password!",
                message: "Please, enter correct login or password",
                textField: passwordTextField
            )
            return
        }
        
        performSegue(withIdentifier: "enterVC", sender: nil)
    }
    
    @IBAction func forgotUserOrPassword(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(title: "Forgot login?", message: "Your user name is: \(user)")
        } else {
            showAlert(title: "Forgot password?", message: "Your password is: \(password)")
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userTextField.text = ""
        passwordTextField.text = ""
    }
}
// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
// MARK: - Keyboard work
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInPressed()
        }
        return true
    }
}

