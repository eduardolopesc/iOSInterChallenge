import UIKit

class PostViewController: UIViewController {

    private lazy var customView = TitleAndDescriptionView(dataSource: self, delegate: self)
    private let viewModel: PostViewModel
    let service = Service()
    
    init(viewModel: PostViewModel){
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
        navigationItem.title = "Postagens de \(viewModel.userName)"
        fetchData()
    }
    
    func fetchData() {
        viewModel.loadData{ () in
            if self.viewModel.posts.isEmpty {
                self.showAlert()
            } else {
                self.customView.tableView.reloadData()
            }
        }
    }

}

// MARK: - TableView Extensions
extension PostViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postId = viewModel.posts[indexPath.row].id
        viewModel.didTapComment(with: postId, by: viewModel.userName)
    }
    
}

extension PostViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAndDescriptionCell", for: indexPath) as? TitleAndDescriptionTableViewCell else {
            return UITableViewCell()
        }
        let post = viewModel.posts[indexPath.row]
        cell.titleLabel.text = post.title
        cell.descriptionLabel.text = post.body
        return cell
    }
    
}
