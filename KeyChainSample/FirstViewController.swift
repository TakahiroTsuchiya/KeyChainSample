//
//  FirstViewController.swift
//  KeyChainSample
//
//  Created by other on 2017/11/04.
//  Copyright © 2017 TakahiroTsuchiya. All rights reserved.
//

import UIKit
import KeychainAccess

class FirstViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!

    private let keyChainKey = "sample"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARKS: Actions
    @IBAction func saveAction(_ sender: Any) {
        print("[SAVE START]")

        guard let inputText = self.inputTextField.text else {
            print("[SAVE STOP - NO INPUT]")
            return
        }
        print("[INPUT VALUE] : " + inputText)

        let keychain = Keychain(service: "com.example.KeyChainSample")
        keychain[keyChainKey] = inputText

        print("[SAVE END]")
    }

    @IBAction func readAction(_ sender: Any) {
        print("[READ END]")

        let keychain = Keychain(service: "com.example.KeyChainSample")
        

        guard let saveValues = try? keychain.getString(keyChainKey) else {
            print("[READ STOP - NO READ]")
            return
        }
        print("[SAVE VALUE] : " + saveValues!)

        self.inputTextField.text = saveValues

        print("[READ END]")
    }
}

