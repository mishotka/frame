import UIKit

extension UIColor {
    static var accentColor: UIColor {
        return UIColor(red: 0.0, green: 0.478, blue: 1.0, alpha: 1.0)
    }
}

class LogInViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let logoImageView = UIImageView()
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        setupViews()
        setupConstraints()
        setupKeyboardObservers()
    }
    
    private func setupViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.image = UIImage(named: "logo")
        logoImageView.contentMode = .scaleAspectFit
        
        let paddingView1 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
        loginTextField.leftView = paddingView1
        loginTextField.font = UIFont.boldSystemFont(ofSize: 16)
        loginTextField.leftViewMode = .always
        loginTextField.placeholder = "Email of phone"
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.layer.borderWidth = 0.5
        loginTextField.layer.cornerRadius = 10
        loginTextField.isUserInteractionEnabled = true
        loginTextField.backgroundColor = .systemGray6
        loginTextField.autocapitalizationType = .none
        loginTextField.tintColor = .accentColor
        
        
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftView = paddingView2
        passwordTextField.font = UIFont.boldSystemFont(ofSize: 16)
        passwordTextField.leftViewMode = .always
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.isUserInteractionEnabled = true
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.autocapitalizationType = .none
        passwordTextField.tintColor = .accentColor
        
        
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        loginButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        
        loginButton.alpha = 1.0
        loginButton.setTitleColor(UIColor.white.withAlphaComponent(1.0), for: .normal)
        loginButton.setTitleColor(UIColor.white.withAlphaComponent(0.8), for: .selected)
        loginButton.setTitleColor(UIColor.white.withAlphaComponent(0.8), for: .highlighted)
        loginButton.setTitleColor(UIColor.white.withAlphaComponent(0.8), for: .disabled)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(loginTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(loginButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            loginTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            loginTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            scrollView.contentInset.bottom = keyboardFrame.height
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = 0
    }
    
    @objc private func logInButtonTapped() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        loginTextField.becomeFirstResponder()
        passwordTextField.becomeFirstResponder()
    }
}
