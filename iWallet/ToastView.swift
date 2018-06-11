//
//  ToastView.swift
//  iWallet
//
//  Created by cmouse on 2018/6/1.
//  Copyright © 2018年 snailgames. All rights reserved.
//

import UIKit
//弹窗工具
class ToastView : NSObject{
    
    static var instance : ToastView = ToastView()
    
    
    var windows = UIApplication.shared.windows
    let rv = UIApplication.shared.keyWindow?.subviews.first as UIView?
    
    //显示加载圈圈
    func showLoadingView() {
        clear()
        
        let frame = CGRect(x: 0, y: 0, width: 78, height: 78)
        
        let loadingContainerView = UIView()
        loadingContainerView.layer.cornerRadius = 12
        loadingContainerView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha: 0.8)
        
        let indicatorWidthHeight :CGFloat = 36
        let loadingIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        loadingIndicatorView.frame = CGRect(x: frame.width/2 - indicatorWidthHeight/2, y: frame.height/2 - indicatorWidthHeight/2, width: indicatorWidthHeight, height: indicatorWidthHeight)
        loadingIndicatorView.startAnimating()
        loadingContainerView.addSubview(loadingIndicatorView)
        
        let window = UIWindow()
        window.backgroundColor = UIColor.clear
        window.frame = frame
        loadingContainerView.frame = frame
        
        window.windowLevel = UIWindowLevelAlert
        window.center = CGPoint(x: rv!.center.x, y: rv!.center.y)
        window.isHidden = false
        window.addSubview(loadingContainerView)
        
        windows.append(window)
        
    }
    
//    //弹窗图片文字
//    func showToast(content:String , imageName:String="icon_cool", duration:CFTimeInterval=1.5) {
//        clear()
//        let frame = CGRectMake(0, 0, 90, 90)
//
//        let toastContainerView = UIView()
//        toastContainerView.layer.cornerRadius = 10
//        toastContainerView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha: 0.7)
//
//        let iconWidthHeight :CGFloat = 36
//        let toastIconView = UIImageView(image: UIImage(named: imageName)!)
//        toastIconView.frame = CGRectMake((frame.width - iconWidthHeight)/2, 15, iconWidthHeight, iconWidthHeight)
//        toastContainerView.addSubview(toastIconView)
//
//        let toastContentView = UILabel(frame: CGRectMake(0, iconWidthHeight + 5, frame.height, frame.height - iconWidthHeight))
//        toastContentView.font = UIFont.systemFontOfSize(13)
//        toastContentView.textColor = UIColor.whiteColor()
//        toastContentView.text = content
//        toastContentView.textAlignment = NSTextAlignment.Center
//        toastContainerView.addSubview(toastContentView)
//
//
//        let window = UIWindow()
//        window.backgroundColor = UIColor.clearColor()
//        window.frame = frame
//        toastContainerView.frame = frame
//
//        window.windowLevel = UIWindowLevelAlert
//        window.center = CGPoint(x: rv.center.x, y: rv.center.y * 16/10)
//        window.hidden = false
//        window.addSubview(toastContainerView)
//        windows.append(window)
//
//        toastContainerView.layer.addAnimation(AnimationUtil.getToastAnimation(duration), forKey: "animation")
//
//        performSelector(#selector(removeToast(_:)), withObject: window, afterDelay: duration)
//    }
    
    //移除当前弹窗
//    func removeToast(sender: AnyObject) {
//
//        if let window = sender as? UIWindow {
//            if let index = windows.index { (item) -> Bool in
//                return item == window
//            }
//            windows.remove(at: index)
//            
//        } else {
//             print("can not find the window")
//        }
//    }
    
    //清除所有弹窗
    func clear() {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        windows.removeAll(keepingCapacity: false)
    }
    
}
