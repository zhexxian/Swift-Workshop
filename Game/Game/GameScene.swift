//
//  GameScene.swift
//  Game
//
//  Created by ruby on 20/1/17.
//  Copyright © 2017 Zhexxian. All rights reserved.
//

import SpriteKit
import GameplayKit

//add bit mask
struct PhysicsCategory{
    static let None:UInt32 = 0
    static let all:UInt32=UInt32.max
    static let Monster:UInt32=0b1
    static let Projectile:UInt32=0b10
    
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let player = SKSpriteNode(imageNamed: "player")
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.white
        
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        
        physicsWorld.gravity = CGVector(dx:0, dy:0) // zero gravity
        
        physicsWorld.contactDelegate = self
        
        self.addChild(player)
        
        
        run(SKAction.repeatForever(
            SKAction.sequence(
                [SKAction.run(addMonster),SKAction.wait(forDuration:1.0)]
            )
        ))
        
        let backgroundMusic = SKAudioNode(fileNamed: "background-music-aac.caf")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)
    }
    
    func projectileDidCollideWithMonster(_ projectile:SKSpriteNode,monster:SKSpriteNode){
        print("Hit")
        projectile.removeFromParent()
        monster.removeFromParent()
    }
    
    func addMonster() {
        
        let monster = SKSpriteNode(imageNamed: "monster")
        
        monster.physicsBody=SKPhysicsBody(rectangleOf: monster.size)
        
        monster.physicsBody?.isDynamic=true
        
        monster.physicsBody?.categoryBitMask=PhysicsCategory.Monster
        
        monster.physicsBody?.contactTestBitMask=PhysicsCategory.Projectile
        
        monster.physicsBody?.collisionBitMask=PhysicsCategory.None
        
        
        
        let actualY = random(min: monster.size.height/2, max: size.height - monster.size.height/2)
        
        monster.position = CGPoint(x: size.width + monster.size.width/2, y: actualY)
        
        addChild(monster)
        
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        
        let actionMove = SKAction.move(to: CGPoint(x: -monster.size.width/2, y: actualY),
                                       duration: TimeInterval(actualDuration))
        
        let actionMoveDone = SKAction.removeFromParent()
        
        
        
        monster.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { // Choose the first touch
            return
        }
        let touchLocation = touch.location(in: self) // Get the location of the touch
        let projectile = SKSpriteNode(imageNamed: "projectile")
        
        projectile.physicsBody=SKPhysicsBody(circleOfRadius: projectile.size.width/2)
        
        projectile.physicsBody?.isDynamic=true
        
        projectile.physicsBody?.categoryBitMask=PhysicsCategory.Projectile
        
        projectile.physicsBody?.contactTestBitMask=PhysicsCategory.Monster
        
        projectile.physicsBody?.collisionBitMask=PhysicsCategory.None
        
        projectile.physicsBody?.usesPreciseCollisionDetection = true
        
        
        projectile.position = player.position
        let offset = touchLocation - projectile.position
        if (offset.x < 0) { return }
        addChild(projectile)
        
        let direction = offset.normalized()
        let shootAmount = direction * 1000
        let realDest = shootAmount + projectile.position
        
        // 9 - Create the actions
        let actionMove = SKAction.move(to: realDest, duration: 2.0)
        let actionMoveDone = SKAction.removeFromParent()
        projectile.run(SKAction.sequence([actionMove, actionMoveDone]))
        run(SKAction.playSoundFileNamed("pew-pew-lei.caf", waitForCompletion: false))
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        // 1
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        // 2
        if ((firstBody.categoryBitMask & PhysicsCategory.Monster != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.Projectile != 0)) {
            // why no projectile
            projectileDidCollideWithMonster(firstBody.node as! SKSpriteNode, monster: secondBody.node as! SKSpriteNode)
        }
        
    }
    
    func random()->CGFloat{
        return CGFloat(Float(arc4random())/0xFFFFFFFF)
    }
    
    func random(min:CGFloat, max:CGFloat)->CGFloat{
        return random()*(max-min)+min
    }

    
}

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

#if !(arch(x86_64) || arch(arm64))
    func sqrt(a: CGFloat) -> CGFloat {
        return CGFloat(sqrtf(Float(a)))
    }
#endif

extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
    func normalized() -> CGPoint {
        return self / length()
    }
}
