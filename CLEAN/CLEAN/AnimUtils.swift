//
//  AnimUtils.swift
//  CLEAN
//
//  Created by eunji on 2018. 5. 21..
//  Copyright © 2018년 eunji. All rights reserved.
//

import UIKit

class AnimUtils: NSObject, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print(fromVC, toVC)
        if let _ = toVC as? UINavigationController {
            return nil//ScrollingAnim(tabBarController : tabBarController)
        } else {
            return nil
        }
    }
}

class ScrollingAnim : NSObject, UIViewControllerAnimatedTransitioning {
    
    weak var transitionContext: UIViewControllerContextTransitioning?
    var tabBarController : UITabBarController
    var fromIndex = 0
    
    init(tabBarController : UITabBarController)
    {
        self.tabBarController = tabBarController
        self.fromIndex = tabBarController.selectedIndex
    }
    
    func transitionDuration(using transitionContext : UIViewControllerContextTransitioning?) -> TimeInterval {
            return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 뷰 만들어주기
        self.transitionContext = transitionContext
        let contatinerView = transitionContext.containerView
        
        // 원래 뷰
        let fromView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        
        // 추가될 뷰
        let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        contatinerView.addSubview(toView!.view)
        
        //var width = toView?.view.bounds.width
        let height = toView?.view.bounds.height
        
        toView!.view.transform = CGAffineTransform(translationX: 0, y: height!)
        
        UIView.animate(withDuration: self.transitionDuration(using: (self.transitionContext)), animations: {
        //입력되는 뷰
        toView?.view.transform = CGAffineTransform.identity
            fromView?.view.transform = CGAffineTransform(translationX: 0, y: -height!)
        }
            
            , completion: { _ in
                
                fromView?.view.transform = CGAffineTransform.identity
                self.transitionContext?.completeTransition(!(self.transitionContext?.transitionWasCancelled)!)
                
                
                
                
        }
                )
        
    }
    
}
