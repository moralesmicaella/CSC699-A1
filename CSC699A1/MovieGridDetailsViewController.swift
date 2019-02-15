//
//  MovieGridDetailsViewController.swift
//  CSC699A1
//
//  Created by Micaella Morales on 2/13/19.
//  Copyright © 2019 Micaella Morales. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieGridDetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var backdropView: UIImageView!
    
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        let date = movie["release_date"] as? String
        releaseDateLabel.text = "Release date: " + date!
        releaseDateLabel.sizeToFit()
        
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        posterView.af_setImage(withURL: posterUrl!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        backdropView.af_setImage(withURL: backdropUrl!)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        performSegue(withIdentifier: "trailerGridSegue", sender: nil)
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
     //Pass the movie trailer to the details view controller
     let trailerViewController = segue.destination as! MovieGridTrailerViewController
     trailerViewController.movie = movie
     
     }

}
