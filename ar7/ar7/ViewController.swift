//
//  ViewController.swift
//  ar7
//
//  Created by Kratik Kamdar on 02/03/22.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    let config = ARWorldTrackingConfiguration()
    
    func showShape() {
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 0.1)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        node.position = SCNVector3(0,0,0)
        node.name = "Sphere"
        let scene = SCNScene()
        sceneView.scene = scene
        scene.rootNode.addChildNode(node)
        
    }
    
    @IBAction func reset(_ sender: Any) {
        sceneView.session.pause()
        sceneView.session.run(config, options: [.resetTracking])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.debugOptions = [ARSCNDebugOptions .showWorldOrigin, ARSCNDebugOptions .showFeaturePoints]
        showShape()
    }


}

