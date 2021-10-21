import Alamofire
import UIKit

struct Service {
    
    static let shared = Service()
    
    func fillUsers(completion: @escaping ([User]?, Error?) -> ()) {
        AF.request("https://jsonplaceholder.typicode.com/users").validate().responseJSON { response in
            guard response.error == nil else {
                completion(nil, response.error)
                return
            }
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([User].self, from: data)
                    completion(models, nil)
                    return
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    func fillPosts(userId: Int, completion: @escaping ([Post]?, Error?) -> ()) {
        AF.request("https://jsonplaceholder.typicode.com/posts?userId=\(userId)").validate().responseJSON { response in
            guard response.error == nil else {
                completion(nil, response.error)
                return
            }
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([Post].self, from: data)
                    completion(models, nil)
                    return
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    func fillComments(postId: Int, completion: @escaping ([Comment]?, Error?) -> ()) {
        AF.request("https://jsonplaceholder.typicode.com/comments?postId=\(postId)").validate().responseJSON { response in
            guard response.error == nil else {
                completion(nil, response.error)
                return
            }
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([Comment].self, from: data)
                    completion(models, nil)
                    return
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    func fillAlbums(userId: Int, completion: @escaping ([Album]?, Error?) -> ()) {
        AF.request("https://jsonplaceholder.typicode.com/albums?userId=\(userId)").validate().responseJSON { response in
            guard response.error == nil else {
                completion(nil, response.error)
                return
            }
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([Album].self, from: data)
                    completion(models, nil)
                    return
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    func fillPhotos(albumId: Int, completion: @escaping ([Photo]?, Error?) -> ()) {
        AF.request("https://jsonplaceholder.typicode.com/photos?albumId=\(albumId)").validate().responseJSON { response in
            guard response.error == nil else {
                completion(nil, response.error)
                return
            }
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([Photo].self, from: data)
                    completion(models, nil)
                    return
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
}

extension UIViewController {
    
    func showAlert() {
        let alert = UIAlertController(title: "Erro", message: "Algo errado aconteceu. Tente novamente mais tarde.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        self.present(alert, animated: true)
        return
    }
}
