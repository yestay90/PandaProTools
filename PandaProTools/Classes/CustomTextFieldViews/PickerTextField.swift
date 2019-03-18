//
//  PickerTextField.swift
//  PandaProTools
//
//  Created by Yestay Muratov on 3/18/19.
//

import Foundation

public protocol PickerTextFieldDelegate {
    func pickerTextField(textfield: UITextField, pickerView: UIPickerView, didSelect row: Int)
    func pickerTextField(textfield: UITextField, pickerView: UIPickerView, titleForRow row: Int) -> String
    func pickerTextFieldNumberOfRows(textfield: UITextField, pickerView: UIPickerView) -> Int
    func pickerTextField(readyButtonClicked button: UIBarButtonItem, textfield: UITextField)
    func pickerTextField(cancelButtonClicked button: UIBarButtonItem, textfield: UITextField)
}

public class PickerTextField: UITextField {
    
    public var pickerDelegate: PickerTextFieldDelegate?
    
    public var iconImage: UIImage = UIImage(named: "arrowDown")!.withRenderingMode(.alwaysTemplate) {
        didSet {
            self.setImageOnRightSide(image: iconImage)
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
    var customPickerView: UIPickerView!
    
    override public init(frame: CGRect) {
        super.init(frame: .zero)
        startSettings()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func startSettings(){
        createToolBarFor()
        setPickerToTextField()
        setImageOnRightSide(image: iconImage, tintColor: imageTintColor)
    }
    
    
    func setPickerToTextField(){
        
        self.customPickerView = UIPickerView()
        self.inputView = customPickerView
        self.customPickerView.delegate = self
        self.customPickerView.dataSource = self
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
        doneButton = UIBarButtonItem(title: self.readyButtonTitle, style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.toolBarReadyButtonClicked(_:)))
        doneButton.accessibilityIdentifier = self.accessibilityIdentifier
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)

        cancelButton = UIBarButtonItem(title: self.cancelButtonTitle, style: .plain, target: self, action: #selector(self.toolBarCancelButtonClicked(_:)))
        cancelButton.accessibilityIdentifier = self.accessibilityIdentifier
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.inputAccessoryView = toolBar
    }
    
    @objc func toolBarReadyButtonClicked(_ button: UIBarButtonItem){
        pickerDelegate?.pickerTextField(readyButtonClicked: button, textfield: self)
    }
    
    @objc func toolBarCancelButtonClicked(_ button: UIBarButtonItem){
        pickerDelegate?.pickerTextField(cancelButtonClicked: button, textfield: self)
    }
}

extension PickerTextField: UIPickerViewDelegate, UIPickerViewDataSource {
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("did select done")
        pickerDelegate?.pickerTextField(textfield: self, pickerView: pickerView, didSelect: row)
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerDelegate?.pickerTextField(textfield: self, pickerView: pickerView, titleForRow: row) ?? "no data"
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(self.pickerDelegate?.pickerTextFieldNumberOfRows(textfield: self, pickerView: pickerView) ?? 0)
        return self.pickerDelegate?.pickerTextFieldNumberOfRows(textfield: self, pickerView: pickerView) ?? 0
    }
}
