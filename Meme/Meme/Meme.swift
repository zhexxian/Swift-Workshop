//
//  Meme.swift
//  
//
//  Created by ruby on 19/1/17.
//
//

import Foundation
import UIKit

class Meme{
    var title:String = "default title"
    var image:UIImage! = UIImage(named:"")
}

var memeArray:[Meme] = []

func prepareMemes(){
    for index in 1...8 {
        let memeInstance:Meme = Meme()
        memeInstance.title = "Image \(index)"
        memeInstance.image = UIImage(named: "Meme \(index).jpg")
        memeArray.append(memeInstance)
    }
}
