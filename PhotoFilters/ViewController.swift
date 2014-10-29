//
//  ViewController.swift
//  PhotoFilters
//
//  Created by Tim Peterson on 10/28/14.
//  Copyright (c) 2014 Tim Peterson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    //create a place to render image before filtering it
    let context = CIContext(options: nil)
    
    @IBAction func applyFilter(sender: AnyObject) {
        let inputImage = CIImage(image: photoImageView.image)
        
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314))/100)]
        
    
        let filteredImage = inputImage.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        
        let renderedImage = context.createCGImage(filteredImage, fromRect: filteredImage.extent())
        
        photoImageView.image = UIImage(CGImage: renderedImage)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

