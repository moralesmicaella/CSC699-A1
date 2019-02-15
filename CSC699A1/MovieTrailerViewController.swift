//
//  MovieTrailerViewController.swift
//  CSC699A1
//
//  Created by Micaella Morales on 2/14/19.
//  Copyright © 2019 Micaella Morales. All rights reserved.
//

import UIKit
import WebKit

class MovieTrailerViewController: UIViewController {

    @IBOutlet weak var trailerView: WKWebView!
    
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let trailerUrl = URL(string: "https://www.youtube.com/watch?v=w7pYhpJaJW8")
        let request:URLRequest = URLRequest(url: trailerUrl!)
        trailerView.load(request)
        
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
