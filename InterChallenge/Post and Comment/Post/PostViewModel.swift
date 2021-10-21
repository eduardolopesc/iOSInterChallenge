import Foundation

final class PostViewModel {
    
    var coordinator: MainCoordinator
    var userId = Int()
    var userName = String()
    var posts = [Post]()
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func loadData(completion: @escaping (() -> Void)) {
        Service.shared.fillPosts(userId: userId) { posts, error in
            if let posts = posts {
                self.posts = posts
            }
            completion()
        }
    }
    
    func didTapComment(with postId: Int, by userName: String) {
        coordinator.goToComments(with: postId, by: userName)
    }
    
}
