//
//  GameScene.swift
//  animationTry
//
//  Created by admin on 29/03/2020.
//  Copyright © 2020 DenysPashkov. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
	var character : SKSpriteNode?
//	Animation containers
	var characterIdleFrames : [SKTexture] = []
	var characterLeftFrames : [SKTexture] = []
    
    override func sceneDidLoad() {
//		take childnode character
		if let player = childNode(withName: "character") as? SKSpriteNode{
//			he is the player now
			character = player
//			for better pixel art presentation
			character?.texture?.filteringMode = .nearest
//			laddy way to add all the animation but not a good one
///			Added this one just because it was a try for the animation and was the fastest way that i logically found
			for i in 1...4{
				let textureName = "swordsm_idle_lefthand_\(i)"
				
				let tempTexture = SKTexture(imageNamed: textureName)
				tempTexture.filteringMode = .nearest
				
				characterIdleFrames.append(tempTexture)
			}
//			same as upstare
			for i in 0...3{
				let textureName = "swordsman-jump-50x30-0\(i)"
				
				let tempTexture = SKTexture(imageNamed: textureName)
				tempTexture.filteringMode = .nearest
				
				characterLeftFrames.append(tempTexture)
			}
			
		}
		
		animateCharacter()
		
    }
//	run the animation
	func animateCharacter() {
		character!.run(SKAction.repeatForever(
		SKAction.animate(with: characterIdleFrames,
						 timePerFrame: 0.2,
						 resize: false,
						 restore: true)),
		withKey:"idleInPlaceBear")
	}
//	go animation 2
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		character?.removeAllActions()
		character!.run(SKAction.repeatForever(
		SKAction.animate(with: characterLeftFrames,
						 timePerFrame: 0.1,
						 resize: false,
						 restore: true)),
		withKey:"idleInPlaceBear")
	}
//	return animation 1
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		character?.removeAllActions()
		character!.run(SKAction.repeatForever(
		SKAction.animate(with: characterIdleFrames,
						 timePerFrame: 0.2,
						 resize: false,
						 restore: true)),
		withKey:"idleInPlaceBear")
	}
    
}
