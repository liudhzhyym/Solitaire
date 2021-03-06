//
//  GameViewController.swift
//  Solitaire
//
//  Created by Eric Milhizer on 1/21/18.
//  Copyright © 2018 Eric Milhizer. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  
    if let view = self.view as! SKView? {
      let scene: GameScene
      if let loadedScene = GameScene.loadGame() {
        print(" -- Loading from saved scene")
//        loadedScene.size = view.frame.size
        loadedScene.loadFromSave = true
        scene = loadedScene
      } else {
        print(" -- Loading from new game")
        scene = GameScene(size: view.frame.size)
      }
      scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
      // Set the scale mode to scale to fit the window
      scene.scaleMode = .aspectFill
    
      print("Scene size: \(scene.size)")
      
      // Present the scene
      let transition = SKTransition.doorsOpenHorizontal(withDuration: 2)
      view.presentScene(scene, transition: transition)
    
      view.ignoresSiblingOrder = true
    
//      view.showsFPS = true
//      view.showsNodeCount = true
    }
  }

  override var shouldAutorotate: Bool {
    return true
  }

  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }

  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  
  
} // GameViewController





