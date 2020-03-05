//
//  QRCodeScanner1.swift
//  WildFork
//
//  Created by Himanshu Singh on 08/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
class QRScannerVC: UIViewController {
    
    @IBOutlet weak var qrCodeView: UIView!
    
    @IBOutlet weak var toolTipButton: UIButton!
    @IBOutlet weak var gotIt: UIButton!
    var scannerViewCOlor:UIColor?
    @IBOutlet weak var scannerView: QRScannerView! {
        didSet {
            scannerView.delegate = self
        }
    }
    var receipeDelegate : ReceipeDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        scannerViewCOlor = scannerView.backgroundColor
        super.viewWillAppear(animated)
        self.qrCodeView.isHidden = true
        self.gotIt.isHidden = true
        self.toolTipButton.setImage(#imageLiteral(resourceName: "tooltip"), for: .normal)
        scannerView.doInitialSetup()
        if !scannerView.isRunning {
            scannerView.startScanning()
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !scannerView.isRunning {
            scannerView.stopScanning()
        }
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tooltipButtonPressed(_ sender: Any) {
        if self.qrCodeView.isHidden{
            scannerView.stopScanning()
            self.qrCodeView.isHidden = false
            scannerView.layer.opacity = 0.4

            self.gotIt.isHidden = false
            self.toolTipButton.setImage(#imageLiteral(resourceName: "tooltipRed"), for: .normal)
        }else{
            scannerView.startScanning()
            self.qrCodeView.isHidden = true
            self.gotIt.isHidden = true
            scannerView.layer.opacity = 1
            self.toolTipButton.setImage(#imageLiteral(resourceName: "tooltip"), for: .normal)
        }
        
    }
    @IBAction func gotItPressed(_ sender: Any) {
        scannerView.startScanning()
        self.qrCodeView.isHidden = true
        self.gotIt.isHidden = true
        scannerView.backgroundColor = scannerViewCOlor
        scannerView.layer.opacity = 1
        self.toolTipButton.setImage(#imageLiteral(resourceName: "tooltip"), for: .normal)
    }
}

extension QRScannerVC: QRScannerViewDelegate {
    func qrScanningDidStop() {
    }
    
    func qrScanningDidFail() {
    }
    
    func qrScanningSucceededWithCode(_ str: String?) {

        if (str?.contains("wildforkfoods"))!{
            self.receipeDelegate?.qrCodeScanned(qrString:/str)
        }else{
            showAlert()
        }
    }
    func showAlert(){
        let alert = UIAlertController(title: "Error", message: "Please scan wild Fork Foods Product QRCode.", preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .destructive){ (action) in
            self.scannerView.startScanning()
        }
        alert.addAction(okay)
        self.present(alert, animated: true, completion: nil)
    }
}
