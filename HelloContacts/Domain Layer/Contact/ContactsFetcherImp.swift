//
// Created by Qiao Zhang on 2/13/17.
// Copyright (c) 2017 Qiao Zhang. All rights reserved.
//

import Foundation
import Contacts

class ContactsFetcherImp: ContactsFetcher {
  
  func fetchContactsAsync(completion: @escaping ([Contact]?) -> Void) {
    let result: [Contact]?
    let rawContacts = CNContactRepository.shared.fetchContacts()
    if let rawContacts = rawContacts {
      result = rawContacts.map { contact in
        Contact(firstName: contact.givenName,
                lastName: contact.familyName,
                imageData: contact.imageData)
      }
    } else {
      result = nil
    }
    completion(result)
  }
}