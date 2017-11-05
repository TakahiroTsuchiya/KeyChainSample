//
//  SecondViewController.swift
//  KeyChainSample
//
//  Created by other on 2017/11/04.
//  Copyright © 2017 TakahiroTsuchiya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!

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
    
    @IBAction func saveAction(_ sender: UIButton) {
        print("[SAVE START]")
        // check input
        guard let saveValues = self.inputTextField.text else {
            print("[SAVE STOP]")
            return
        }
        print(" - " + saveValues)

        UserDefaults.standard.set(saveValues, forKey: keyChainKey)
        print("[SAVE END]")
    }
    
    @IBAction func readAction(_ sender: UIButton) {
        print("[READ START]")
        guard let readValues = UserDefaults.standard.string(forKey: keyChainKey) else {
            print("[READ STOP]")
            return
        }
        print(" - " + readValues)
        self.outputLabel.text = readValues
        print("[READ END]")
    }
}

