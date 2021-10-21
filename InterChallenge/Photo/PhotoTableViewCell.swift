import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    lazy var photoImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.contentMode = .left
        lbl.text = "title"
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - View Configuration Methods
extension PhotoTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        self.contentView.addSubViews([photoImageView, titleLabel])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            photoImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150),
            photoImageView.widthAnchor.constraint(equalToConstant: 150),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    func configureViews() {
        backgroundColor = .white
    }
    
}
