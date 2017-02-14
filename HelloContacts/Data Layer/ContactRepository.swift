//
// Created by Qiao Zhang on 2/14/17.
// Copyright (c) 2017 Qiao Zhang. All rights reserved.
//

import Foundation
import Contacts

class CNContactRepository {
  
  private var localCNContactStore: CNContactStore
  
  static let shared = CNContactRepository()
  private init() {
    localCNContactStore = CNContactStore()
    if CNContactStore.authorizationStatus(for: .contacts) == .notDetermined {
      localCNContactStore.requestAccess(for: .contacts) { _ in }
    }
  }
  
  func fetchContacts() -> [CNContact]? {
    let keysToFetch = [
        CNContactGivenNameKey as CNKeyDescriptor,
        CNContactFamilyNameKey as CNKeyDescriptor,
        CNContactImageDataKey as CNKeyDescriptor,
        CNContactImageDataAvailableKey as CNKeyDescriptor,
    ]
    let containerId = localCNContactStore.defaultContainerIdentifier()
    let predicate = CNContact.predicateForContactsInContainer(
        withIdentifier: containerId)
    let contacts = try! localCNContactStore.unifiedContacts(
        matching: predicate, keysToFetch: keysToFetch)
    return contacts
  }
}
