//
//  PurchaseManager.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/24/23.
//

import Foundation
import StoreKit

@MainActor
class PurchaseManager: ObservableObject {
    
    //Code used for monitoring billing outside of app
    private var updates: Task<Void, Never>? = nil
    
    init( ) {
        updates = observeTransactionUpdates()
    }
    
    deinit {
        updates?.cancel()
    }

    // Code used for purchasing
    private let productIds = ["com.frosthacker.unlockallcharacters",]

    @Published
    private(set) var products: [Product] = []
    private var productsLoaded = false

    func loadProducts() async throws {
        guard !self.productsLoaded else { return }
        do {
            self.products = try await Product.products(for: productIds)
            print("Products fetched: \(self.products)")
            self.productsLoaded = true
        } catch {
            print("Error loading products: \(error)")
            throw error
        }
    }

    func purchase(_ product: Product) async throws {
        let result = try await product.purchase()

        switch result {
        case let .success(.verified(transaction)):
            // Successful purhcase
            await transaction.finish()
            await self.updatePurchasedProducts()
            
        case let .success(.unverified(_, error)):
            // Successful purchase but transaction/receipt can't be verified
            // Could be a jailbroken phone
            break
        case .pending:
            // Transaction waiting on SCA (Strong Customer Authentication) or
            // approval from Ask to Buy
            break
        case .userCancelled:
            // ^^^
            break
        @unknown default:
            break
        }
    }
    
    //Update after purchase code
    @Published private(set) var purchasedProductIDs = Set<String>()
    
    var hasUnlockedChars: Bool {
        return !self.purchasedProductIDs.isEmpty
    }
    
    func updatePurchasedProducts() async {
        for await result in Transaction.currentEntitlements {
            guard case .verified(let transaction) = result else{
                continue
            }
            if transaction.revocationDate == nil{
                self.purchasedProductIDs.insert(transaction.productID)
                    
            } else {
                self.purchasedProductIDs.remove(transaction.productID)
            }
            
        }
        
    }
    
    //Func for monitoring outside transactions
    private func observeTransactionUpdates() -> Task<Void, Never> {
        Task(priority: .background) { [unowned self] in
            for await verificationResult in Transaction.updates {
                //Using verification would be better?
                await self.updatePurchasedProducts()
            }
        }
    }
    
    
    
}
