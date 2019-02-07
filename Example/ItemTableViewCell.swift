import UIKit
import tmdb_swift

class ItemTableViewCell: UITableViewCell {

    func configure(with media: Media) {
        if let imageURL = media.imagePath {
            URLSession.shared.dataTask(with: imageURL) { [weak self] (data, _, _) in
                guard let strongSelf = self, let data = data else { return }
                DispatchQueue.main.async {
                    strongSelf.imageView?.image = UIImage(data: data)
                }
            }.resume()
        }
        textLabel?.text = media.title
        detailTextLabel?.text = "Avarage rate is \(media.averageVote) with \(media.votes) votes"
    }
}
