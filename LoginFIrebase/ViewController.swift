//
//  ViewController.swift
//  LoginFIrebase
//
//  Created by Guilherme Borba on 27/11/17.
//  Copyright © 2017 Guilherme Borba. All rights reserved.
//

import UIKit
import QuickLook
import Firebase
import FirebaseAuth

class ViewController: UIViewController, QLPreviewControllerDataSource, QLPreviewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func logOut(_ sender: UIButton) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
    }
    
    @IBAction func btn_Pdf(_ sender: Any) {
        let preview = QLPreviewController()
        preview.dataSource = self
        self.present(preview, animated: true, completion: nil)
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let path =  Bundle.main.path(forResource: "carol_15", ofType: "pdf")
        let url = URL(fileURLWithPath: path!)
        
        return url as QLPreviewItem
        
    }

}

