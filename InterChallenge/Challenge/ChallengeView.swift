import UIKit

final class ChallengeView: UIView {
    
    var tableView: UITableView = {
        let tbl = UITableView(frame: .zero, style: .plain)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.separatorStyle = .singleLine
        tbl.rowHeight = UITableView.automaticDimension
        tbl.backgroundColor = .white
        return tbl
    }()
    
    init(dataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        setupTableView(dataSource: dataSource)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView(dataSource: UITableViewDataSource){
        tableView.dataSource = dataSource
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
    }
    
}

// MARK: - View Configuration Methods
extension ChallengeView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubViews([tableView])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configureViews() {
        backgroundColor = .white
    }
    
}

