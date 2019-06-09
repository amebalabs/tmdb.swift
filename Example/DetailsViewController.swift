//
//  DetailsViewController.swift
//  Example
//
//  Created by Alex on 12/25/18.
//  Copyright © 2018 Ameba Labs. All rights reserved.
//

import UIKit
import TMDB

class DetailsViewController: UIViewController {
    var item: Media!
    @IBOutlet weak var textView: UITextView!
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        switch item.type {
        case .movie:
            TMDB.Movies.getDetails(item.id) { response in
                switch response {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.textView.text = try? String(data: encoder.encode(data), encoding: .utf8) ?? ""
                    }
                case .failure(let error):
                    print(error)
                }
            }
        case .tv:
            TMDB.TV.getDetails(item.id) { response in
                switch response {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.textView.text = try? String(data: encoder.encode(data), encoding: .utf8) ?? ""
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
