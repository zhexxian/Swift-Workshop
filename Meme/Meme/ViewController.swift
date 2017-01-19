//
//  ViewController.swift
//  Meme
//
//  Created by ruby on 19/1/17.
//  Copyright © 2017 Zhexxian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        prepareMemes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButton(_ sender: UIButton) {
        loadNextMeme()
    }
    
    func loadNextMeme(){
        var memeIndex:Int = Int(arc4random_uniform(UInt32(8)))
        uiImageView.image = memeArray[memeIndex].image
        titleLabel.text = memeArray[memeIndex].title

    }
    

}

