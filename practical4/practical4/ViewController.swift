//
//  ViewController.swift
//  practical4
//
//  Created by Kratik Kamdar on 07/04/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    let config = ARWorldTrackingConfiguration()
    
    @IBAction func add(_ sender: UIButton) {
        let sphere = SCNSphere(radius: 0.1)
        sphere.firstMaterial?.diffuse.contents = UIColor.red
        sphere.firstMaterial?.specular.contents = UIColor.black
        
        let node = SCNNode()
        node.geometry = sphere
        
        let scene = SCNScene()
        scene.rootNode.addChildNode(node)
        sceneView.scene = scene
    }
    
    @IBAction func reset(_ sender: UIButton) {
        sceneView.session.pause()
        sceneView.scene.rootNode.enumerateChildNodes{ (node, _) in
                    node.removeFromParentNode()
                }
        
        sceneView.session.run(config, options: [.resetTracking, .removeExistingAnchors])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions .showWorldOrigin, ARSCNDebugOptions .showFeaturePoints]
        sceneView.session.run(config)
    }


}

