//
//  Model.swift
//  cotizApp
//
//  Created by Luis Olavarría on 02-08-24.
//

import Foundation

struct QuotationItem {
    var quantity: Int
    var description: String
    var schedule: String
    var totalValue: Double
}

struct Quotation {
    var company: String
    var requestDate: Date
    var contact: String
    var phone: String
    var email: String
    var items: [QuotationItem]
    var laborCost: Double
    var netValue: Double
}
