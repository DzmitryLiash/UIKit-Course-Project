//
//  ViewController.swift
//  UIKit Course Project
//
//  Created by Дмитрий Лещёв on 11/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var hideAllElements: UISwitch!
    @IBOutlet var switchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup Main label
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        // Setup Segment control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // Setup Slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .lightGray
        slider.thumbTintColor = .blue
        
        mainLabel.text = String(slider.value)
        
        // Setup Date Picker
        datePicker.locale = Locale(identifier: "ru_RU")
        
        // Локализация в соответствии с текущими настройками системы
        //datePicker.locale = Locale.current
        
        // Setup Switch
        //hideAllElements.onTintColor = .red
        switchLabel.text = "Скрыть все элементы"
    }

    @IBAction func changeSegment() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .blue
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .white
        case 2:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .yellow
        default:
            break
        }
    }
    
    @IBAction func sliderAction() {
        let backgroundColor = view.backgroundColor
        view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(slider.value))
        mainLabel.text = String(slider.value)
    }
    
    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else { return }
        
        if let _ = Double(inputText) {
            showAlert(title: "Wrong format!", message: "Please enter your name")
            print("Wrong formar")
        } else {
            mainLabel.text = inputText
            textField.text = nil
        }
        
    }
    
    @IBAction func changeDate() {
        let dateFornatter = DateFormatter()
        dateFornatter.dateStyle = .long
        dateFornatter.locale = Locale(identifier: "ru_RU")
        
        
        let dateValue = dateFornatter.string(from: datePicker.date)
        mainLabel.text = dateValue
    }
    
    @IBAction func switchAction() {
        segmentedControl.isHidden.toggle()
        mainLabel.isHidden.toggle()
        slider.isHidden.toggle()
        textField.isHidden.toggle()
        doneButton.isHidden.toggle()
        datePicker.isHidden.toggle()

        switchLabel.text = hideAllElements.isOn ? "Скрыть все элементы" : "Отобразить все элементы"
    }
    
}

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

