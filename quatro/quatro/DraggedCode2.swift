//
//  DraggedCode2.swift
//  quatro
//
//  Created by ap19ade on 28/10/2019.
//  Copyright © 2019 ap19ade. All rights reserved.
//

import UIKit

class DraggedCode2: UIImageView {
    
    var startLocation: CGPoint?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startLocation = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let currentLocation = touches.first?.location(in: self)
        
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        var newCenter = CGPoint(x:self.center.x+dx, y: self.center.y+dy)
        
        //restrict movement to screen bounds
        let halfx = self.bounds.midX
            newCenter.x = max(halfx, newCenter.x)
            newCenter.x = min(self.superview!.bounds.width - halfx, newCenter.x)
        
        let halfy = self.bounds.midY
            newCenter.y = max(halfy, newCenter.y)
            newCenter.y = min(self.superview!.bounds.height - halfy, newCenter.y)
        
        self.center = newCenter
    }

}
