//
//  BudgetViewController.swift
//  BudgetingApp
//
//  Created by CHRISTINA on 4/28/22.
//

import Foundation
import UIKit
import SwiftUI

class BudgetViewController: UIViewController {
	
	@IBOutlet weak var theContainer: UIView!
	@IBOutlet weak var plusButton: UIButton!
	
	@StateObject var budgets = Budgets()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let childView = UIHostingController(rootView: BudgetView())
		
		addChild(childView)
		childView.view.frame = theContainer.bounds
		theContainer.addSubview(childView.view)
		
		
	}
	
	struct BudgetView: View {
		@StateObject var budgets = Budgets()
		@State private var showingAddBudget = false
		
		var body: some View {
			List {
				
				ForEach(budgets.bitems) { bitem in
					HStack {
						VStack(alignment: .leading) {
							Text(bitem.name)
								.font(.headline)
							Text("Current Balance: ")
							//Text(String(currentBalance))
						}
						
						Spacer()
						Text("Goal: ")
						Text(bitem.amount, format: .currency(code: "USD"))
					}
				}
				.onDelete(perform: removeItems)
			}
		}
		
		func removeItems(at offsets: IndexSet) {
			budgets.bitems.remove(atOffsets: offsets)
		}
	}
	
	
	@IBAction func plusButtonClicked(_ sender: Any) {
		print("budget plus clicked")
	}
	
	
}
