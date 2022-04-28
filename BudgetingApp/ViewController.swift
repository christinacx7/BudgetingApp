//
//  ViewController.swift
//  BudgetingApp
//
//  Created by CHRISTINA on 4/7/22.
//

import Foundation
import UIKit
import SwiftUI

class ViewController: UIViewController {
	
	@IBOutlet weak var theContainer: UIView!
	@IBOutlet weak var currentBalance: UILabel!
	@IBOutlet weak var spentBalance: UILabel!
	@IBOutlet weak var incomeBalance: UILabel!
	@IBOutlet weak var budgetButton: UIButton!
	
	@StateObject var expenses = Expenses()

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let childView = UIHostingController(rootView: ExpenseView())
		
		addChild(childView)
		childView.view.frame = theContainer.bounds
		theContainer.addSubview(childView.view)
		
		updateBalanceLabels()
	}
	
	@IBAction func budgetButtonPressed(_ sender: Any) {
		print("Button Pressed")
		
	}


struct ExpenseView: View {
	@StateObject var expenses = Expenses()
	@State private var showingAddExpense = false
	
	var body: some View {
		List {
			
			ForEach(expenses.items) { item in
				HStack {
					VStack(alignment: .leading) {
						Text(item.name)
							.font(.headline)
						Text(item.type)
					}
					
					Spacer()
					
					Text(item.amount, format: .currency(code: "USD"))
				}
			}
			.onDelete(perform: removeItems)
		}
	}
	
	func removeItems(at offsets: IndexSet) {
		expenses.items.remove(atOffsets: offsets)
	}
}

struct ExpenseView_Previews: PreviewProvider {
	static var previews: some View {
		ExpenseView()
	}
}
	
	func spent() -> Double{
		var total = 0.00
		
		for item in expenses.items {
			if String(item.type) != "Income" {
				total += item.amount
			}
		}
		
		return total
	}
	
	func income() -> Double{
		var total = 0.00
		
		for item in expenses.items {
			if String(item.type) == "Income" {
				total += item.amount
			}
		}
		
		return total
	}
	
	func updateBalance() -> Double{
		var balance = 0.00
		
		balance = income() - spent()
		
		return balance
	}
	
	func updateBalanceLabels(){
		incomeBalance.text = "$" + String(income())
		spentBalance.text = "$" + String(spent())
		currentBalance.text = "$" + String(updateBalance())
	}
}
