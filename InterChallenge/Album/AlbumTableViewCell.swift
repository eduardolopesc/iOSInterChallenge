import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    lazy var albumNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.contentMode = .scaleToFill
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

// MARK: - View Configuration Methods
extension AlbumTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        addSubViews([albumNameLabel])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            albumNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            albumNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            albumNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            albumNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func configureViews() {
        backgroundColor = .white
    }
    
}
