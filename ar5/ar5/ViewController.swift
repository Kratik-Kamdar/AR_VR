//
//  ViewController.swift
//  ar5
//
//  Created by Kratik Kamdar on 26/02/22.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    let configuration = ARWorldTrackingConfiguration()

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet var xSlider: UISlider!
    @IBOutlet var ySlider: UISlider!
    @IBOutlet var zSlider: UISlider!
    
    @IBAction func addBtn(_ sender: UIButton) {
        showShape()
    }
    
    @IBAction func rstBtn(_ sender: UIButton) {
        sceneView.session.pause()
        
        sceneView.scene.rootNode.enumerateChildNodes {  (node, _) in
            if node.name == "Sphere" {
                node.removeFromParentNode()
            }
        }
        sceneView.session.run(configuration, options: [.resetTracking])
    }
    
    func showShape() {
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 0.1)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        node.position = SCNVector3(xSlider.value, ySlider.value, zSlider.value)
        node.name = "Sphere"
        let scene = SCNScene()
        sceneView.scene = scene
        scene.rootNode.addChildNode(node)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions .showWorldOrigin, ARSCNDebugOptions .showFeaturePoints]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.session.run(configuration)
    }


}

