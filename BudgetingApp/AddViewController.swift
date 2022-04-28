//
//  AddViewController.swift
//  BudgetingApp
//
//  Created by CHRISTINA on 4/27/22.
//

import Foundation
import UIKit
import SwiftUI

class AddViewController: UIViewController {
	
	@IBOutlet weak var theContainer: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let childView = UIHostingController(rootView: AddView(expenses: Expenses()))
		
		addChild(childView)
		childView.view.frame = theContainer.bounds
		theContainer.addSubview(childView.view)
	}
	
	struct AddView: View {
		@ObservedObject var expenses: Expenses
		@Environment(\.dismiss) var dismiss
		
		@State private var name = ""
		@State private var type = "Income"
		@State private var amount = 0.0
		
		let types = ["Housing", "Subscription", "Entertainment", "Food", "Income"]
		
		var body: some View {
			NavigationView {
				Form {
					TextField("Name of Expense", text: $name)
					
					Picker("Type of Expense", selection: $type) {
						ForEach(types, id: \.self) {
							Text($0)
						}
					}
					
					TextField("Amount", value: $amount, format: .currency(code: "USD"))
						.keyboardType(.decimalPad)
				}
				.navigationTitle("Add Expense")
				.toolbar {
					Button("Save") {
						
						let item = ExpenseItem(name: name, type: type, amount: amount)
						expenses.items.append(item)
						dismiss()
						
						
						for item in expenses.items {
							print(item.name)
						}
					}
				}
			}
		}
	}
	
	struct AddView_Previews: PreviewProvider {
		static var previews: some View {
			AddView(expenses: Expenses())
		}
	}

	
}
