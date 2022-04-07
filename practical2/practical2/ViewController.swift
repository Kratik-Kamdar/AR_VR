//
//  ViewController.swift
//  practical2
//  Single View App
//
//  Created by Kratik Kamdar.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            let configuration = ARWorldTrackingConfiguration()
            sceneView.session.run(configuration)
            sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
            sceneView.showsStatistics = true
            
            let scene = SCNScene()
            sceneView.scene = scene
            
        
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            sceneView.session.pause()
        }

}

