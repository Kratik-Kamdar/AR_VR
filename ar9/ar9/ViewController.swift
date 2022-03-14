//
//  ViewController.swift
//  ar9
//
//  Created by Kratik Kamdar on 09/03/22.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    let config = ARWorldTrackingConfiguration()
    let showLight = SCNNode()
    
    func showShape() {
        let sphere = SCNSphere()
        sphere.firstMaterial?.diffuse.contents = UIColor.white
        
        let node = SCNNode()
        node.geometry = sphere
        node.position = SCNVector3(0.1, 0, 0)
        
        let scene = SCNScene()
        scene.background.contents = UIColor.black
        scene.rootNode.addChildNode(node)
        sceneView.scene = scene
    }
    
    func lightOn() {
        showLight.light = SCNLight()
        showLight.light?.type = .spot
        showLight.light?.color = UIColor(white: 0.6, alpha: 1.0)
        showLight.position = SCNVector3(0, 0, 0)
        
        let scene = SCNScene()
        scene.rootNode.addChildNode(showLight)
        sceneView.scene = scene
    }
    
    @IBAction func tempChange(_ sender: UISlider) {
        showLight.light?.temperature = CGFloat(sender.value)
    }
    
    @IBAction func intenChange(_ sender: UISlider) {
        showLight.light?.intensity = CGFloat(sender.value)
    }
    
    @IBAction func colorchange(_ sender: UIButton) {
        showLight.light?.color = sender.backgroundColor!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.automaticallyUpdatesLighting = true
        sceneView.debugOptions = [ARSCNDebugOptions .showWorldOrigin, ARSCNDebugOptions .showFeaturePoints]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showShape()
        sceneView.session.run(config)
    }


}

