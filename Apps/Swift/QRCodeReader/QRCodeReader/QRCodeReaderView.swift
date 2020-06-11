//
//  QRCodeReaderView.swift
//  QRCodeReader
//
//  Created by Gustavo Tavares on 08.03.20.
//  Copyright © 2020 Gustavo Tavares. All rights reserved.
//

import SwiftUI
import AVFoundation

struct QRCodeReaderView: View {
    
    let controller = QRScannerController()
    
    var body: some View {
        Text("QRCode Reader").onAppear {
            
            let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera], mediaType: .video, position: .back)
            guard let captureDevice = discoverySession.devices.first else {
                print("Failed to get the camera device!")
                return
            }

            do {
                
                let input = try AVCaptureDeviceInput(device: captureDevice)
                self.controller.captureSession?.addInput(input)
                
                let captureMetadataOutput = AVCaptureMetadataOutput()
                self.controller.captureSession?.addOutput(captureMetadataOutput)
                
                captureMetadataOutput.setMetadataObjectsDelegate(self.controller, queue: DispatchQueue.main)
                captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
                
            } catch {
                print(error)
                return
            }
            
        }
    }
}

struct QRCodeReaderView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeReaderView()
    }
}

class QRScannerController: NSObject, AVCaptureMetadataOutputObjectsDelegate {
    
    var captureSession: AVCaptureSession?
    var videPreviewLayer: AVCaptureVideoPreviewLayer?
    
}
