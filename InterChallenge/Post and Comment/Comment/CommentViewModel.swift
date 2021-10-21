import Foundation

final class CommentViewModel {
    var postId = Int()
    var userName = String()
    var comments = [Comment]()
    
    func loadData(completion: @escaping (() -> Void)) {
        Service.shared.fillComments(postId: postId) { comments, error in
            if let comments = comments {
                self.comments = comments
            }
            completion()
        }
    }
    
}
