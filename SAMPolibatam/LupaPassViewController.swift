//
//  LupaPassViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 19/02/21.
//

import UIKit

class LupaPassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        if let navController = self.navigationController {
          navController.popViewController(animated: true)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
// Start - Href ke link helpdesk
    @IBAction func btnLink(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://helpdesk.polibatam.ac.id")! as URL, options: [:], completionHandler: nil)
    }
// End - Href ke link helpdesk
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
