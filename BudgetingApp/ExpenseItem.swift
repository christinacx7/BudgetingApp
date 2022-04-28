//
//  ExpenseItem.swift
//  BudgetingApp
//
//  Created by CHRISTINA on 4/26/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
	var id = UUID()
	let name: String
	let type: String
	let amount: Double
}
