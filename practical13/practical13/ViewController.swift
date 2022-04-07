//
//  ViewController.swift
//  practical13
//  Drawing on screen
//
//  Created by Kratik Kamdar.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet var `switch`: UISwitch!
    @IBOutlet var clearBtn: UIButton!
    
    let config = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions .showWorldOrigin, ARSCNDebugOptions .showFeaturePoints]
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        sceneView.session.run(config)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        guard let pov = sceneView.pointOfView else {return}
        let transform = pov.transform
        let rotation = SCNVector3(-transform .m31, -transform .m32, -transform .m33)
        let location = SCNVector3(transform .m41, transform .m42, transform .m43)
        let currentPosition = SCNVector3(rotation.x + location.x, rotation.y + location.y, rotation.z + location.z)
        DispatchQueue.main.async {
            if self.switch.isOn {
                let draw = SCNNode()
                draw.geometry = SCNCone(topRadius: 0, bottomRadius: 0.005, height: 0.005)
                draw.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
                draw.position = currentPosition
                self.sceneView.scene.rootNode.addChildNode(draw)
            } else {
                let point = SCNNode()
                point.name = "pnt"
                point.geometry = SCNCone(topRadius: 0, bottomRadius: 0.005, height: 0.005)
                point.position = currentPosition
                point.geometry?.firstMaterial?.diffuse.contents = UIColor.black
                self.sceneView.scene.rootNode.enumerateChildNodes({ (node, _) in
                    if node.name == "pnt" {
                        node.removeFromParentNode()
                    }
                })
                self.sceneView.scene.rootNode.addChildNode(point)
            }
            if self.clearBtn.isHighlighted {
                self.sceneView.scene.rootNode.enumerateChildNodes({ (node, _) in
                    node.removeFromParentNode()
                })
            }
        }
    }

}

