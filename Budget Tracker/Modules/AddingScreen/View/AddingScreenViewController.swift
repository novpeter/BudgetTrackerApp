//
//  AddingScreenViewController.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class AddingScreenViewController: UIViewController, UITextFieldDelegate {
    
    var presenter: AddingScreenViewOutput!
    
    private lazy var contentView = AddingScreenView()
    private lazy var notificationCenter = NotificationCenter.default
    
    override func loadView() {
        super.loadView()
        
        view = contentView
        addTargets()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.categoryPicker.delegate = self
        contentView.commentTextView.delegate = self
        contentView.titleTextField.delegate = self
        
        configureDateToolbar()
        configureCategoryToolbar()
        configureKeyboardObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
        presenter.setInitialState()
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    
    private func addTargets() {
        contentView.addButton.addTarget(self, action: #selector(onClickAdd), for: .touchUpInside)
        contentView.closeButton.addTarget(self, action: #selector(onClickClose), for: .touchUpInside)
        contentView.datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        
        contentView
            .operationTypeSegmentedControl
            .incomeTypeButton
            .addTarget(self, action: #selector(selectType), for: .touchUpInside)
        contentView
            .operationTypeSegmentedControl
            .expenseTypeButton
            .addTarget(self, action: #selector(selectType), for: .touchUpInside)
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: contentView.closeButton)
    }
    
    private func configureDateToolbar() {
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(endEditingDateTextField));
        contentView.dateToolBar.setItems([spaceButton, doneButton], animated: false)
    }
    
    private func configureCategoryToolbar() {
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(endEditingCategoryTextField));
        contentView.categoryToolBar.setItems([spaceButton, doneButton], animated: false)
    }
    
    
    // MARK: - Keyboard observers
    
    private func configureKeyboardObservers() {
        notificationCenter.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.showKeyboard(notification: notification)
        }
        notificationCenter.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.hideKeyboard()
        }
    }
    
    @objc private func showKeyboard(notification: Notification) {
        guard let keyboardFrameValue = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
        let keyboardFrame = view.convert(keyboardFrameValue.cgRectValue, from: nil)
        contentView.scrollView.contentInset.bottom = keyboardFrame.size.height
        contentView.scrollView.scrollIndicatorInsets = contentView.scrollView.contentInset
    }
    
    @objc private func hideKeyboard() {
        contentView.scrollView.contentInset = .zero
        contentView.scrollView.scrollIndicatorInsets = contentView.scrollView.contentInset
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    // MARK: - Button handlers
    
    @objc
    func onClickAdd(_ sender: UIButton) {
        sender.pulsate()
        presenter.addNewOperation(
            title: contentView.titleTextField.text,
            comment: contentView.commentTextView.text,
            category: contentView.categoryTextField.text,
            date: contentView.dateTextField.text,
            sum: contentView.sumTextField.text
        )
    }
    
    @objc
    func onClickClose(_ sender: UIButton) {
        sender.pulsate()
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func selectType(_ sender: UIButton) {
        contentView.operationTypeSegmentedControl.selectType(index: sender.tag)
        switch sender.tag {
        case 0:
            contentView.categoryStackView.isHidden = true
        case 1:
            contentView.categoryStackView.isHidden = false
        default: break
        }
    }
    
    
    // MARK: - Picker handlers
    
    @objc
    func datePickerValueChanged(_ sender: UIDatePicker) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            self.contentView.dateTextField.text = dateFormatter.string(from: sender.date)
        }
    }
    
    @objc
    private func endEditingCategoryTextField() {
        contentView.categoryTextField.endEditing(true)
    }
    
    @objc
    private func endEditingDateTextField() {
        contentView.dateTextField.endEditing(true)
    }
}

// MARK: - Adding Screen View Input
extension AddingScreenViewController: AddingScreenViewInput {
    
    func setValues(selectedIndex: Int, category: Categories, date: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            switch selectedIndex {
            case 0:
                self.contentView.categoryStackView.isHidden = true
            case 1:
                self.contentView.categoryStackView.isHidden = false
            default: break
            }
            self.contentView.operationTypeSegmentedControl.selectType(index: selectedIndex)
            self.contentView.categoryTextField.text = category.rawValue
            self.contentView.categoryIcon.image = Categories.getCategoryIcon(category)
            self.contentView.dateTextField.text = date
        }
    }
}


// MARK: - Category picker methods
extension AddingScreenViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Categories.allValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Categories.allValues[row].rawValue
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        contentView.categoryTextField.text = Categories.allValues[row].rawValue
        contentView.categoryIcon.image = Categories.getCategoryIcon(Categories.allValues[row])
    }
}

// MARK: - Comment TextView methods
extension AddingScreenViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.tag == 1 else { return }
        if textView.textColor == TextColors.gray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard textView.tag == 1 else { return }
        if textView.text.isEmpty {
            textView.text = Placeholders.comment
            textView.textColor = TextColors.gray
        }
    }
}
