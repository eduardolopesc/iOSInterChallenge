import UIKit

class AlbumViewController: UIViewController {

    private lazy var customView = AlbumView(dataSource: self, delegate: self)
    private let viewModel: AlbumViewModel
    
    init(viewModel: AlbumViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Álbuns de \(viewModel.userName)"
        fetchData()
    }
    
    func fetchData() {
        viewModel.loadData{ () in
            if self.viewModel.albums.isEmpty {
                self.showAlert()
            } else {
                self.customView.tableView.reloadData()
            }
        }
    }

}

// MARK: - TableView Extensions
extension AlbumViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userId = viewModel.albums[indexPath.row].id
        viewModel.didTapPhoto(with: userId, by: viewModel.userName)
    }
}

extension AlbumViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as? AlbumTableViewCell else {
            return UITableViewCell()
        }
        let album = viewModel.albums[indexPath.row]
        cell.albumNameLabel.text = album.title
        return cell
    }
    
}
