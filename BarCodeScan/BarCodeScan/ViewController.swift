//
//  ViewController.swift
//  BarCodeScan
//
//  Created by Dragon Kao on 2017/1/8.
//  Copyright © 2017年 Dragon Kao. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    
    
    
    @IBOutlet weak var MessageLabel: UILabel!
    
    
    var captureSession : AVCaptureSession?
    var videoPreviewLayer : AVCaptureVideoPreviewLayer?
    var qrCodeFrameView : UIView?
    
    let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
        do {
            let input : AnyObject! = try? AVCaptureDeviceInput(device: captureDevice)
            
            captureSession = AVCaptureSession()
            captureSession?.addInput(input as! AVCaptureInput!)
            
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypePDF417Code]
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            
            captureSession?.startRunning()
            view.bringSubview(toFront: MessageLabel)
            //        view.bringSubview(toFront: topbar)
            qrCodeFrameView = UIView()
            
            if let qrCodeFrameView = qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                view.addSubview(qrCodeFrameView)
                view.bringSubview(toFront: qrCodeFrameView)
            }
            
            
        } catch {
            print("error")
            return
        }
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            MessageLabel.text = "No BarCode is detected"
            return
        }
        
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        // 指定物件 QRcode
        if metadataObj.type == AVMetadataObjectTypeQRCode {
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = (barCodeObject?.bounds)!
            
            
            if metadataObj.stringValue != nil {
                MessageLabel.text = metadataObj.stringValue
            }
            
        } else if metadataObj.type == AVMetadataObjectTypeCode39Code {
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = (barCodeObject?.bounds)!
            
            if metadataObj.stringValue != nil {
                MessageLabel.text = metadataObj.stringValue
            }
        } else if metadataObj.type == AVMetadataObjectTypeCode128Code {
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = (barCodeObject?.bounds)!
            
            if metadataObj.stringValue != nil {
                MessageLabel.text = metadataObj.stringValue
            }
        } else if metadataObj.type == AVMetadataObjectTypeEAN13Code {
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = (barCodeObject?.bounds)!
            
            if metadataObj.stringValue != nil {
                MessageLabel.text = metadataObj.stringValue
            }
        } else if metadataObj.type == AVMetadataObjectTypePDF417Code {
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = (barCodeObject?.bounds)!
            
            if metadataObj.stringValue != nil {
                MessageLabel.text = metadataObj.stringValue
            }
        } else if metadataObj.type == AVMetadataObjectTypeUPCECode {
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = (barCodeObject?.bounds)!
            
            if metadataObj.stringValue != nil {
                MessageLabel.text = metadataObj.stringValue
            }
        } else if metadataObj.type == AVMetadataObjectTypeEAN8Code {
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = (barCodeObject?.bounds)!
            
            if metadataObj.stringValue != nil {
                MessageLabel.text = metadataObj.stringValue
            }
        }


    }



}

