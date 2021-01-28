//
//  SettingsViewController.swift
//  Prework
//
//  Created by Laura Hernandez on 1/28/21.
//

import UIKit

class SettingsViewController: UIViewController {
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var percentage1Label: UITextField!
    @IBOutlet weak var percentage2Label: UITextField!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var percentage3Label: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingsView.layer.cornerRadius = 10
        
        
        let defaults = UserDefaults.standard
        let per1 = defaults.string(forKey: "percentage1") ?? "15"
        let per2 = defaults.string(forKey: "percentage2") ?? "18"
        let per3 = defaults.string(forKey: "percentage3") ?? "20"
        defaults.synchronize()
        percentage1Label.text = per1
        percentage2Label.text = per2
        percentage3Label.text = per3
    }


   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    
    @IBAction func percentage1Changed(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(percentage1Label.text, forKey: "percentage1")
        defaults.synchronize()
    }
    @IBAction func percentage2Changed(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(percentage2Label.text, forKey: "percentage2")
        defaults.synchronize()
    }
    @IBAction func percentage3Changed(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(percentage3Label.text, forKey: "percentage3")
        defaults.synchronize()
    }
    

}
