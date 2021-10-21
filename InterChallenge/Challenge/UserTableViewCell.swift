import UIKit

protocol UserTableViewCellDelegate: AnyObject {
    func didTapAlbums(with userId: Int, by name: String)
    func didTapPosts(with userId: Int, by name: String)
}

class UserTableViewCell: UITableViewCell {
    
    lazy var initialsLabel: UILabel = {
        let lbl = UILabel()
        lbl.contentMode = .scaleToFill
        lbl.backgroundColor = .systemYellow
        lbl.contentMode = .center
        lbl.text = "initials"
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var initialsView: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.backgroundColor = .systemYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.contentMode = .center
        lbl.text = "name"
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var userNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.contentMode = .left
        lbl.text = "username"
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var emailLabel: UILabel = {
        let lbl = UILabel()
        lbl.contentMode = .left
        lbl.text = "email"
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var phoneLabel: UILabel = {
        let lbl = UILabel()
        lbl.contentMode = .left
        lbl.text = "phone"
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var albumsButton: UIButton = {
        let btn = UIButton()
        btn.contentMode = .scaleToFill
        btn.setTitle("ÁLBUNS", for: .normal)
        btn.contentHorizontalAlignment = .center
        btn.contentVerticalAlignment = .center
        btn.titleLabel?.lineBreakMode = .byTruncatingMiddle
        btn.setTitleColor(.systemOrange, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(albumsAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var postsButton: UIButton = {
        let btn = UIButton()
        btn.contentMode = .scaleToFill
        btn.setTitle("POSTAGENS", for: .normal)
        btn.contentHorizontalAlignment = .center
        btn.contentVerticalAlignment = .center
        btn.setTitleColor(.systemOrange, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(postsAction), for: .touchUpInside)
        return btn
    }()

    
    lazy var buttonStack: UIStackView = {
        let stk = UIStackView()
        stk.contentMode = .scaleToFill
        stk.distribution = .fillEqually
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    lazy var separator: UIView = {
        let sprtr = UIView()
        sprtr.contentMode = .scaleToFill
        sprtr.backgroundColor = .lightGray
        sprtr.translatesAutoresizingMaskIntoConstraints = false
        return sprtr
    }()
    
    
    var id: Int = 0
    var delegate: UserTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func albumsAction(sender: UIButton) {
        delegate?.didTapAlbums(with: id, by: nameLabel.text ?? "")
    }
    
    @objc func postsAction(sender: UIButton) {
        delegate?.didTapPosts(with: id, by: nameLabel.text ?? "")
    }
}

// MARK: - View Configuration Methods
extension UserTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        self.contentView.addSubViews([userNameLabel, emailLabel, phoneLabel, nameLabel, initialsView, separator, buttonStack])
        initialsView.addSubview(initialsLabel)
        buttonStack.addArrangedSubview(albumsButton)
        buttonStack.addArrangedSubview(postsButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            initialsView.widthAnchor.constraint(equalToConstant: 88),
            initialsView.heightAnchor.constraint(equalToConstant: 88),
            initialsView.trailingAnchor.constraint(equalTo: initialsLabel.trailingAnchor),
            
            initialsLabel.topAnchor.constraint(equalTo: initialsView.topAnchor),
            
            initialsView.bottomAnchor.constraint(equalTo: initialsLabel.bottomAnchor),
            
            initialsLabel.leadingAnchor.constraint(equalTo: initialsView.leadingAnchor, constant: 32),
            
            initialsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            initialsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: initialsView.bottomAnchor, constant: 16),
            
            separator.widthAnchor.constraint(equalToConstant: 2),
            separator.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            separator.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 32),
            separator.leadingAnchor.constraint(equalTo: initialsView.trailingAnchor, constant: 32),
            
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            userNameLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 16),
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            emailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 24),
            emailLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 16),
            
            phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 24),
            phoneLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 16),
            phoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            buttonStack.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 64),
            buttonStack.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 24),
            buttonStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            buttonStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buttonStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func configureViews() {
        backgroundColor = .white
    }
    
}
