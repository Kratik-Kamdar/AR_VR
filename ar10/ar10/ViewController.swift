//
//  ViewController.swift
//  ar10
//
//  Created by Kratik Kamdar on 13/03/22.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    let config = ARWorldTrackingConfiguration()
    
    func showShape() {
        let base = SCNBox(width: 0.05, height: 0.1, length: 0.1, chamferRadius: 0)
        base.firstMaterial?.diffuse.contents  = UIColor.brown
        
        let baseNode = SCNNode(geometry: base)
        baseNode.position = SCNVector3(x: 0, y: 0, z: -0.5)
        
        let scene = SCNScene()
        scene.rootNode.addChildNode(baseNode)
        
        let roof = SCNPyramid(width: 0.05, height: 0.5, length: 0.1)
        roof.firstMaterial?.diffuse.contents = UIColor.red
        
        let roofNode = SCNNode(geometry: roof)
        roofNode.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        baseNode.addChildNode(roofNode)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions .showWorldOrigin, ARSCNDebugOptions .showFeaturePoints]
        showShape()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        sceneView.session.run(config)
    }


}

