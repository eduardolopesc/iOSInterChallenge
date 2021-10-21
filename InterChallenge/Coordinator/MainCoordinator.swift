import UIKit

class MainCoordinator: Coordinator {

var childCoordinators = [Coordinator]()
var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ChallengeViewModel(coordinator: self)
        let controller = ChallengeViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToAlbums(with userId: Int, by name: String) {
        let viewModel = AlbumViewModel(coordinator: self)
        viewModel.userId = userId
        viewModel.userName = name
        let controller = AlbumViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToPosts(with userId: Int, by name: String) {
        let viewModel = PostViewModel(coordinator: self)
        viewModel.userId = userId
        viewModel.userName = name
        let controller = PostViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToComments(with postId: Int, by userName: String) {
        let viewModel = CommentViewModel()
        viewModel.postId = postId
        viewModel.userName = userName
        let controller = CommentViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToPhoto(with albumId: Int, by userName: String) {
        let viewModel = PhotoViewModel(coordinator: self)
        viewModel.albumId = albumId
        viewModel.userName = userName
        let controller = PhotoViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToDetail(with name: String, by image: UIImage) {
        let viewModel = DetailsViewModel()
        viewModel.name = name
        viewModel.photo = image
        let controller = DetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
}
