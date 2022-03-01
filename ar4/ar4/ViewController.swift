//
//  ViewController.swift
//  ar4
//
//  Created by Kratik Kamdar on 26/02/22.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    
    func addShape() {
        let node = SCNNode()
        node.geometry = SCNSphere()
        node.geometry?.firstMaterial?.lightingModel = .physicallyBased
        node.geometry?.firstMaterial?.metalness.contents = UIColor(white: 1.0, alpha: 1.0)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor(white: 0.2, alpha: 1.0)
        node.geometry?.firstMaterial?.roughness.contents = UIColor(white: 0.03, alpha: 1.0)
        node.geometry?.firstMaterial?.transparencyMode = .dualLayer
        node.geometry?.firstMaterial?.isDoubleSided = true
        node.geometry?.firstMaterial?.transparency = 0.2
        let scene = SCNScene()
        scene.rootNode.addChildNode(node)
        sceneView.scene = scene
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let configuration = ARWorldTrackingConfiguration()
        sceneView.debugOptions = [ARSCNDebugOptions .showWorldOrigin, ARSCNDebugOptions .showFeaturePoints]
        sceneView.autoenablesDefaultLighting = true
        sceneView.session.run(configuration)
        addShape()
    }


}

