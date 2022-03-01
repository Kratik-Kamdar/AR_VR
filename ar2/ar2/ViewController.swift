//
//  ViewController.swift
//  ar2
//
//  Created by Kratik Kamdar on 26/02/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        let scene = SCNScene(named: "art.scnassets/dragon.scn")!
        sceneView.scene = scene
       
    }


}

