import Foundation

final class ChallengeViewModel {
    var coordinator: MainCoordinator
    var users = [User]()
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func loadData(completion: @escaping (() -> Void)) {
        Service.shared.fillUsers() { users, error in
            if let users = users {
                self.users = users
            }
            completion()
        }
    }
    
}

extension ChallengeViewModel: UserTableViewCellDelegate {
    func didTapAlbums(with userId: Int, by name: String) {
        coordinator.goToAlbums(with: userId, by: name)
    }
    
    func didTapPosts(with userId: Int, by name: String) {
        coordinator.goToPosts(with: userId, by: name)
    }
    
}
