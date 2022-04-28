//
//  BudgetItem.swift
//  BudgetingApp
//
//  Created by CHRISTINA on 4/28/22.
//

import Foundation

struct BudgetItem: Identifiable, Codable {
	var id = UUID()
	let name: String
	let amount: Double
}
