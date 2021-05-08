//
//  GameScene.swift
//  pong-hackathon
//
//  Created by Dexter Maher on 5/8/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var paddleLeft : SKSpriteNode?
    private var paddleRight : SKSpriteNode?
    private var ball : SKSpriteNode?
    public var lastBallPos : Int?
    var shouldUpdate = true
    
    override func didMove(to view: SKView) {
        
        self.paddleLeft = self.childNode(withName: "paddle1") as? SKSpriteNode
        self.paddleRight = self.childNode(withName: "paddle2") as? SKSpriteNode
        self.ball = self.childNode(withName: "ball") as? SKSpriteNode
        self.lastBallPos = 0
        
        if let ball = self.ball {
            ball.physicsBody?.velocity = CGVector(dx: 800, dy: 500)
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        paddleLeft?.position = CGPoint(x: paddleLeft?.position.x ?? 0, y: pos.y )
        
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
//    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
//        let number = Int.random(in: 0..<100)
//
//        let xPos = paddleRight?.position.x
//        let newPoint = CGPoint(x: xPos ?? 0, y: ball?.position.y ?? 0)
//
//
//        if ((number % 9) != 0) {
//            self.paddleRight?.position = newPoint
//        }
//
//    }
    
    override func update(_ currentTime: TimeInterval) {
        let movementSpeed = 22
        let updateSpeed = currentTime
        let updateValue = Int(updateSpeed / 1000) / movementSpeed
        if let ball = self.ball {
            if let paddleRight = self.paddleRight {
                let isAbove = ball.position.y > paddleRight.position.y
                let xPos = paddleRight.position.x
                let yPos = isAbove ? paddleRight.position.y + CGFloat(updateValue) : paddleRight.position.y - CGFloat(updateValue)
                let newPoint = CGPoint(x: xPos, y: yPos)
                    paddleRight.position = newPoint
            }
            
        }
        
        
        
    }
}
