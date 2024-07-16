import UIKit

class ProfileHeaderView: UIView {
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image = UIImage(named: "kiano")
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Hipster Kiano"
        return label
    }()

    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Whiting for something..."
        return label
    }()
    private var statusText: String = ""
    
    let statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.clipsToBounds = true
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 4
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(subtitleLabel)
        addSubview(addButton)
        addSubview(statusTextField)
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 80),
            avatarImageView.heightAnchor.constraint(equalToConstant: 80),
        
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            nameLabel.heightAnchor.constraint(equalToConstant: 24),
        
            subtitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 140),
            subtitleLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -10),
            
            statusTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 4),
            statusTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 140),
            statusTextField.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor),
            statusTextField.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -10),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            addButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 33),
            addButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }

    @objc func buttonPressed() {
        if let statusText = statusTextField.text, !statusText.isEmpty {
            subtitleLabel.text = statusText
            statusTextField.text = ""
        } else {
            subtitleLabel.text = "Whiting for something..."
        }
    }
}
