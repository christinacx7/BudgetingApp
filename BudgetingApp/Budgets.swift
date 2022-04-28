//
//  Budgets.swift
//  BudgetingApp
//
//  Created by CHRISTINA on 4/28/22.
//

import Foundation


class Budgets: ObservableObject {
	@Published var bitems = [BudgetItem]() {
		didSet {
			if let encoded = try? JSONEncoder().encode(bitems) {
				UserDefaults.standard.set(encoded, forKey: "BItems")
			}
		}
	}
	
	init() {
		if let bsavedItems = UserDefaults.standard.data(forKey: "BItems") {
			if let decodedItems = try? JSONDecoder().decode([BudgetItem].self, from: bsavedItems) {
				bitems = decodedItems
				return
			}
		}
		
		bitems = []
	}
}
