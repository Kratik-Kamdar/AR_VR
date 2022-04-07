//
//  ViewController.swift
//  practical6
//  Adding different shapes in sceneView
//
//  Created by Kratik Kamdar.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    let configuration = ARWorldTrackingConfiguration()
    let node = SCNNode()

    @IBOutlet var sceneView: ARSCNView!
    
    @IBAction func sphere(_ sender: UIButton) {
        node.removeFromParentNode()
        node.geometry = SCNSphere(radius: 0.1)
        addShape(node: node)
    }
    
    @IBAction func cone(_ sender: UIButton) {
        node.removeFromParentNode()
        node.geometry = SCNCone(topRadius: 0, bottomRadius: 0.1, height: 0.1)
        addShape(node: node)
    }
    
    @IBAction func pyramid(_ sender: UIButton) {
        node.removeFromParentNode()
        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        addShape(node: node)
    }
    
    @IBAction func torus(_ sender: UIButton) {
        node.removeFromParentNode()
        node.geometry = SCNTorus(ringRadius: 0.1, pipeRadius: 0.2)
        addShape(node: node)
    }
    
    @IBAction func cylinder(_ sender: UIButton) {
        node.removeFromParentNode()
        node.geometry = SCNCylinder(radius: 0.1, height: 0.1)
        addShape(node: node)
    }
    
    @IBAction func tube(_ sender: UIButton) {
        node.removeFromParentNode()
        node.geometry = SCNTube(innerRadius: 0.1, outerRadius: 0.2, height: 0.1)
        addShape(node: node)
    }
    
    @IBAction func capsule(_ sender: UIButton) {
        node.removeFromParentNode()
        node.geometry = SCNCapsule(capRadius: 0.1, height: 0.1)
        addShape(node: node)
    }
    
    @IBAction func reset(_ sender: UIButton) {
        sceneView.session.pause()
        node.removeFromParentNode()
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.session.run(configuration, options: [.resetTracking])
    }
    
    func addShape(node: SCNNode) {
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
        
        sceneView.autoenablesDefaultLighting = true
        sceneView.session.run(configuration)
    }

}

