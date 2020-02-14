//
//  DateTextfield.swift
//  SmartAstana
//
//  Created by Yestay Muratov on 11/14/18.
//  Copyright © 2018 PandaMobile. All rights reserved.
//

import Foundation

public protocol DateTextFieldDelegate {
    func dateTextFieldDelegate(didChoose date: Date, textfield: UITextField)
    func dateTextFieldDelegate(readyButtonClicked button: UIBarButtonItem, textfield: UITextField)
    func dateTextFieldDelegate(cancelButtonClicked button: UIBarButtonItem, textfield: UITextField)
}

public class DateTextField: UITextField {
    
    public var dateDelegate: DateTextFieldDelegate?
    
    public var iconImage: UIImage = #imageLiteral(resourceName: "iconDate").withRenderingMode(.alwaysTemplate) {
        didSet {
//            self.setImageOnRightSide(image: iconImage)
        }
    }
    
    public var imageTintColor: UIColor = .black {
        didSet {
            self.rightView?.tintColor = imageTintColor
        }
    }
    
    public var toolBarBackgroundColor: UIColor = .blue {
        didSet {
            self.toolBar.barTintColor = toolBarBackgroundColor
        }
    }
    
    public var toolBarTintColor: UIColor = .white {
        didSet {
            self.toolBar.tintColor = toolBarTintColor
        }
    }
    
    public var readyButtonTitle: String = "Ready" {
        didSet {
            doneButton.title = readyButtonTitle
        }
    }
    
    public var cancelButtonTitle: String = "Cancel" {
        didSet {
            cancelButton.title = cancelButtonTitle
        }
    }
    
    var toolBar: UIToolbar!
    var doneButton: UIBarButtonItem!
    var cancelButton: UIBarButtonItem!
    public var customDatePicker: UIDatePicker!
    
    public init(_ iconImage: UIImage, imageTintColor: UIColor, toolBarBackgroundColor: UIColor, readyButtonTitle: String, cancelButtonTitle: String) {
        super.init(frame: .zero)
        self.iconImage = iconImage
        self.imageTintColor = imageTintColor
        self.toolBarBackgroundColor = toolBarBackgroundColor
        self.readyButtonTitle = readyButtonTitle
        self.cancelButtonTitle = cancelButtonTitle
    }
    
    override public init(frame: CGRect) {
        super.init(frame: .zero)
        
        setDatePickerToTextField()
        self.createToolBarFor()
//        self.setImageOnRightSide(image: iconImage, tintColor: imageTintColor)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDatePickerToTextField(){
        
        customDatePicker = UIDatePicker()
        customDatePicker.datePickerMode = .date
        customDatePicker.date = NSDate() as Date
        customDatePicker.locale = Locale(identifier: "ru_ru")
        customDatePicker.accessibilityIdentifier = self.accessibilityIdentifier
        customDatePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
        self.inputView = customDatePicker
    }
    
    @objc func handleDatePicker(_ sender: UIDatePicker) {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd.MM.yyyy"
        dateDelegate?.dateTextFieldDelegate(didChoose: sender.date, textfield: self)
    }
    
    func createToolBarFor(){
        
        // add tool box
        toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = toolBarTintColor
        toolBar.sizeToFit()
        toolBar.barTintColor = toolBarBackgroundColor
        
        // Adds the buttons
        doneButton = UIBarButtonItem(title: self.readyButtonTitle, style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.toolBarReadyButtonClicked(_:)))
        doneButton.accessibilityIdentifier = self.accessibilityIdentifier
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        cancelButton = UIBarButtonItem(title: self.cancelButtonTitle, style: .plain, target: self, action: #selector(self.toolBarCancelButtonClicked(_:)))
        cancelButton.accessibilityIdentifier = self.accessibilityIdentifier
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.inputAccessoryView = toolBar
    }
    
    @objc func toolBarReadyButtonClicked(_ button: UIBarButtonItem){
        print(customDatePicker.date)
        dateDelegate?.dateTextFieldDelegate(readyButtonClicked: button, textfield: self)
    }
    
    @objc func toolBarCancelButtonClicked(_ button: UIBarButtonItem){
        
        dateDelegate?.dateTextFieldDelegate(cancelButtonClicked: button, textfield: self)
    }
}
