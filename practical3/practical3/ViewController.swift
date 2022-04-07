//
//  ViewController.swift
//  practical3
//  Adding object structure
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
        
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
        sceneView.showsStatistics = true
        
        addShape()
        
    }
    
    func addShape(){
        let sphere = SCNSphere(radius: 0.1)
        sphere.firstMaterial?.diffuse.contents = UIColor.yellow
        
        let node = SCNNode()
        node.geometry = sphere
        
        let scene = SCNScene()
        scene.rootNode.addChildNode(node)
        
        sceneView.scene = scene
    }


}

