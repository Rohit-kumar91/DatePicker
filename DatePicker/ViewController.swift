//
//  ViewController.swift
//  DatePicker
//
//  Created by Rohit Prajapati on 22/02/19.
//  Copyright © 2019 Rohit Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dpTF: UITextField!
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createDatePicker()
        
        textView.layer.borderColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1.0).cgColor
        textView.layer.borderWidth = 1.5
        textView.layer.cornerRadius = 4
        
        
    }
    
    func createDatePicker() {
        
        // Format the date picker
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date()
        
        dpTF.inputView = datePicker
        
        //create a toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let donebutton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClick))
        toolbar.setItems([donebutton], animated: true)
        dpTF.inputAccessoryView = toolbar
        
    }
    
    
    @objc func doneClick() {
        //format the date display in txtfield.
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        dpTF.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }


}

