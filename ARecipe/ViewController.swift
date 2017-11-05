//
//  ViewController.swift
//  ARecipe
//
//  Created by kingcos on 04/11/2017.
//  Copyright © 2017 kingcos. All rights reserved.
//

import UIKit
import Photos
import ALCameraViewController
import Kingfisher
import PKHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var mainImageView: UIImageView!
    
    lazy var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(triggerCamera))
        mainImageView.addGestureRecognizer(gesture)
    }
    
    @IBAction func triggerNextButton(_ sender: UIButton) {
        let controller = WebController()
        controller.urlString = viewModel.mlResult?.href.first
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension ViewController {
    @objc func triggerCamera() {
        let params = CroppingParameters(isEnabled: true,
                                        allowResizing: false,
                                        allowMoving: true,
                                        minimumSize: CGSize(width: 100, height: 100))
        let cameraViewController = CameraViewController(
            croppingParameters: params,
            allowsLibraryAccess: true,
            allowsSwapCameraOrientation: false,
            allowVolumeButtonCapture: true) { [weak self] image, asset in
                guard let image = image else {
                    return
                }
                
                var data: Data?
                if image.size.width > 2000 {
                    data = UIImageJPEGRepresentation(image.scale(by: 8), 1)
                } else {
                    data = UIImageJPEGRepresentation(image, 1)
                }
        
                guard let imageData = data else { return }
                self?.viewModel.request(imageData: imageData) { string in
                    guard let urlString = string else {
                        HUD.flash(.error, delay: 1.0)
                        self?.mainImageView.image = #imageLiteral(resourceName: "placeholder")
                        return
                    }
                    let url = URL(string: API_URL + "/img/" + urlString)
                    
                    DispatchQueue.main.async {
                        self?.mainImageView.kf.setImage(with: url)
                    }
                }
//                if self?.mainImageView.image == #imageLiteral(resourceName: "placeholder") {
//                    self?.nextButton.isEnabled = false
//                } else {
                    self?.nextButton.isEnabled = true
//                }
            self?.dismiss(animated: true)
        }
        present(cameraViewController, animated: true)
    }
}

extension ViewController {
    func addRect(_ startPoint: CGPoint,
                 _ endPoint: CGPoint,
                 _ key: String) {
        let redView = UIView(frame: CGRect(x: startPoint.x,
                                           y: startPoint.y,
                                           width: endPoint.x - startPoint.x,
                                           height: endPoint.y - startPoint.y))
        redView.layer.borderWidth = 2.0
        redView.layer.borderColor = UIColor.red.cgColor
        mainImageView.addSubview(redView)
    }
}
