//
//  MovieGridTrailerViewController.swift
//  CSC699A1
//
//  Created by Micaella Morales on 2/14/19.
//  Copyright © 2019 Micaella Morales. All rights reserved.
//

import UIKit
import WebKit

class MovieGridTrailerViewController: UIViewController {

    @IBOutlet weak var trailerView: WKWebView!
    
    var id: String = ""
    var movie: [[String:Any]]!
    var index: [String:Any]!
    let typeNeeded = "Trailer"
    var type: String = ""
    var key: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/" + id + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.movie = dataDictionary["results"] as? [[String:Any]]
                
                //looks for the right trailer
                for i in 0...self.movie.count {
                    self.index = self.movie[i]
                    self.type = (self.index["type"] as? String)!
                    if(self.type == self.typeNeeded){
                        self.key = (self.index["key"] as? String)!
                        break
                    }
                }
                
                let trailerUrl = URL(string: "https://www.youtube.com/watch?v=" + self.key)
                let request:URLRequest = URLRequest(url: trailerUrl!)
                self.trailerView.load(request)
            }
        }
        task.resume()
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
