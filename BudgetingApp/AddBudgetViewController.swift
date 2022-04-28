//
//  AddBudgetViewController.swift
//  BudgetingApp
//
//  Created by CHRISTINA on 4/28/22.
//

import Foundation
import UIKit
import SwiftUI

class AddBudgetViewController: UIViewController {
	
	@IBOutlet weak var theContainer: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let childView = UIHostingController(rootView: AddBudgetView(budgets:Budgets()))
		
		addChild(childView)
		childView.view.frame = theContainer.bounds
		theContainer.addSubview(childView.view)
	}
	
	struct AddBudgetView: View {
		@ObservedObject var budgets: Budgets
		@Environment(\.dismiss) var dismiss
		
		@State private var name = ""
		@State private var amount = 0.0
		
		
		var body: some View {
			NavigationView {
				Form {
					TextField("Name of Budget", text: $name)
					
					TextField("Budget Goal", value: $amount, format: .currency(code: "USD"))
						.keyboardType(.decimalPad)
				}
				.navigationTitle("Add New Budget")
				.toolbar {
					Button("Save") {
						let bitem = BudgetItem(name: name, amount: amount)
						budgets.bitems.append(bitem)
						dismiss()
						
						for item in budgets.bitems {
							print(item.name)
						}
						
						}
					}
				}
			
		}
	}
	
	struct AddView_Previews: PreviewProvider {
		static var previews: some View {
			AddBudgetView(budgets:Budgets())
		}
	}
	
	
}
