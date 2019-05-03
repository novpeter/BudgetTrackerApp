//
//  AddingScreenViewController.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class AddingScreenViewController: UIViewController {
    
    var presenter: AddingScreenViewOutput!
    
    private lazy var contentView = AddingScreenView()
    
    override func loadView() {
        super.loadView()
        
        view = contentView
        addTargets()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.categoryPicker.delegate = self
        contentView.commentTextView.delegate = self
        
        configureDateToolbar()
        configureCategoryToolbar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
        presenter.setInitialState()
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
        navigationController?.navigationBar.barTintColor = BackgroundColors.White
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
    
    
    // MARK: - Button handlers
    
    @objc func onClickAdd(_ sender: UIButton) {
        sender.pulsate()
        presenter.addNewOperation(
            title: contentView.titleTextField.text,
            comment: contentView.commentTextView.text,
            category: contentView.categoryTextField.text,
            date: contentView.dateTextField.text,
            sum: contentView.sumTextField.text
        )
    }
    
    @objc func onClickClose(_ sender: UIButton) {
        sender.pulsate()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func selectType(_ sender: UIButton) {
        contentView.operationTypeSegmentedControl.selectType(index: sender.tag)
        if sender.tag == 0 {
            contentView.categoryStackView.isHidden = true
        }
        else if sender.tag == 1 {
            contentView.categoryStackView.isHidden = false
        }
    }
    
    
    // MARK: - Picker handlers
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            self.contentView.dateTextField.text = dateFormatter.string(from: sender.date)
        }
    }
    
    @objc private func endEditingCategoryTextField() {
        contentView.categoryTextField.endEditing(true)
    }
    
    @objc private func endEditingDateTextField() {
        contentView.dateTextField.endEditing(true)
    }
}

// MARK: - Adding Screen View Input
extension AddingScreenViewController: AddingScreenViewInput {
    
    func setValues(selectedIndex: Int, category: Categories, date: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if selectedIndex == 0 {
                self.contentView.categoryStackView.isHidden = true
            }
            else if selectedIndex == 1 {
                self.contentView.categoryStackView.isHidden = false
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
        if textView.textColor == TextColors.Grey {
            textView.text = nil
            textView.textColor = TextColors.Black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard textView.tag == 1 else { return }
        if textView.text.isEmpty {
            textView.text = Placeholders.Comment
            textView.textColor = TextColors.Grey
        }
    }
}
