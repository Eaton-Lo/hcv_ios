import UIKit
import SwiftSpinner

class ViewController: UIViewController {
    @IBOutlet weak var paramsTF1: UITextField!
    @IBOutlet weak var paramsTF2: UITextField!
    @IBOutlet weak var paramsTF3: UITextField!
    @IBOutlet weak var paramsTF4: UITextField!
    @IBOutlet weak var paramsTF5: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func submitButton(_ sender: Any) {
        var parameters:[String : Any] = [:]
        parameters["params1"] = paramsTF1.text
        parameters["params2"] = paramsTF2.text
        parameters["params3"] = paramsTF3.text
        parameters["params4"] = paramsTF4.text
        parameters["params5"] = paramsTF5.text
        SwiftSpinner.show("CONNECTING..")

        APIHelper.postParams(parameters: parameters){
            //callback
            (response, status) in
            SwiftSpinner.hide()
            
            if (200...299 ~= status){
                self.paramsTF1.text = ""
                self.paramsTF2.text = ""
                self.paramsTF3.text = ""
                self.paramsTF4.text = ""
                self.paramsTF5.text = ""
            }else{
              //error handle
            }
        }
    }
}

