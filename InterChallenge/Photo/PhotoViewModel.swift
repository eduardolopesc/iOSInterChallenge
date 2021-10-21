import UIKit

final class PhotoViewModel {
    
    var coordinator: MainCoordinator
    var albumId = Int()
    var userName = String()
    var photos = [Photo]()
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func loadData(completion: @escaping (() -> Void)) {
        Service.shared.fillPhotos(albumId: albumId) { photos, error in
            if let photos = photos {
                self.photos = photos
            }
            completion()
        }
    }
    
    func didTapDetail(with name: String, by image: UIImage) {
        coordinator.goToDetail(with: name, by: image)
    }
    
}


