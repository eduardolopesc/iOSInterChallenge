import UIKit

final class AlbumView: UIView {
    
    var tableView: UITableView = {
        let tbl = UITableView(frame: .zero, style: .plain)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.separatorStyle = .singleLine
        tbl.rowHeight = UITableView.automaticDimension
        tbl.backgroundColor = .white
        return tbl
    }()
    
    init(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        super.init(frame: .zero)
        setupTableView(dataSource: dataSource, delegate: delegate)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate){
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "AlbumCell")
    }
    
}

// MARK: - View Configuration Methods
extension AlbumView: ViewConfiguration {
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

