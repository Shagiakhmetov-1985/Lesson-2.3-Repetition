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
    
    private let user = User.getUserData()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewController = tabBarController.viewControllers else { return }

        viewController.forEach {
            if let enterVC = $0 as? EnterViewController {
                enterVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                let aboutMeVC = navigationVC.topViewController as! AboutMeViewController
                aboutMeVC.user = user
            }
        }
        
    }
    
    @IBAction func logInPressed() {
        if userTextField.text != user.login || passwordTextField.text != user.password {
            showAlert(
                title: "Invalid login or password!",
                message: "Please, enter correct login or password",
                textField: passwordTextField
            )
            return
        }
    }
    
    @IBAction func forgotUserOrPassword(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(title: "Forgot login?", message: "Your user name is: \(user.login)")
        } else {
            showAlert(title: "Forgot password?", message: "Your password is: \(user.password)")
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
            performSegue(withIdentifier: "enterVC", sender: nil)
        }
        return true
    }
}

