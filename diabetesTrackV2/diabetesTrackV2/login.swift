import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let username = usernameTextField.text, !username.isEmpty else {
            showAlert(withTitle: "Error", message: "Username is required")
            return
        }

        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(withTitle: "Error", message: "Password is required")
            return
        }

        // TODO: Call backend API to validate username and password
        // Example:
        // let isLoggedIn = BackendService.login(username: username, password: password)
        // if isLoggedIn {
        //     performSegue(withIdentifier: "loginSuccessSegue", sender: self)
        // } else {
        //     showAlert(withTitle: "Error", message: "Invalid username or password")
        // }

    }

    func showAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

}
