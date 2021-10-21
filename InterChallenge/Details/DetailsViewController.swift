import UIKit

class DetailsViewController: UIViewController {
    
    private lazy var customView = DetailsView()
    private let viewModel: DetailsViewModel
    let service = Service()
    
    init(viewModel: DetailsViewModel){
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
        customView.detailImageView.image = viewModel.photo
        customView.nameLabel.text = viewModel.name
    }
}
