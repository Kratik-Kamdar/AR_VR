//
//  ViewController.swift
//  practical11
//  Display text in 3D
//
//  Created by Kratik Kamdar.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.session.run(configuration)
        sceneView.showsStatistics = true
        
        let node = SCNNode()
        node.geometry = SCNText(string: "Kitkat", extrusionDepth: 0.2)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        node.position = SCNVector3(0,0,0)
        sceneView.scene.rootNode.addChildNode(node)
        
    }


}

