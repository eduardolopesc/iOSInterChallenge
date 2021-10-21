import Foundation

final class AlbumViewModel {
    
    var coordinator: MainCoordinator
    var userId = Int()
    var userName = String()
    var albums = [Album]()
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func loadData(completion: @escaping (() -> Void)) {
        Service.shared.fillAlbums(userId: userId) { albums, error in
            if let albums = albums {
                self.albums = albums
            }
            completion()
        }
    }
    
    func didTapPhoto(with userId: Int, by userName: String) {
        coordinator.goToPhoto(with: userId, by: userName)
    }
    
}
