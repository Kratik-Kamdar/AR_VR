//
//  ViewController.swift
//  ar8
//
//  Created by Kratik Kamdar on 03/03/22.
// WAP to show the comination of various shapes available.

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var xSlider: UISlider!
    @IBOutlet var ySlider: UISlider!
    @IBOutlet var zSlider: UISlider!
    
    

    @IBOutlet var sceneView: ARSCNView!
    
    let config = ARWorldTrackingConfiguration()
    
    func addShape() {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 0.1, y: 0.1))
        shape.addLine(to: CGPoint(x: 0.1, y: 0.1))
        shape.addLine(to: CGPoint(x: 0.1, y: -0.03))
        let customShape = SCNShape(path: shape, extrusionDepth: 0.1)
        
        let node = SCNNode()
        node.geometry = customShape
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        node.position = SCNVector3(x: xSlider.value, y: ySlider.value, z: zSlider.value)
        let scene = SCNScene()
        scene.rootNode.addChildNode(node)
        
        sceneView.scene = scene
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions .showWorldOrigin, ARSCNDebugOptions .showFeaturePoints]
        addShape()
    }


}

