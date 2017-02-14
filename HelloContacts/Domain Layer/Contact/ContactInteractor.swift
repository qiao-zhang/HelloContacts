//
// Created by Qiao Zhang on 2/13/17.
// Copyright (c) 2017 Qiao Zhang. All rights reserved.
//

import Foundation
import Contacts

protocol ContactInteractor {
  func retrieveContacts()
}

protocol ContactInteractorUpstream: class {
  func contactsLoaded(_ contacts: [Contact]?)
}

protocol ContactsFetcher {
  func fetchContactsAsync(completion: @escaping ([Contact]?) -> Void)
}

class ContactInteractorImp: ContactInteractor {
  unowned let upstream: ContactInteractorUpstream
  var fetcher: ContactsFetcher!
  
  init(upstream: ContactInteractorUpstream) {
    self.upstream = upstream
  }
  
  func retrieveContacts() {
    fetcher.fetchContactsAsync { [weak self] in
      guard let strongSelf = self else { return }
      strongSelf.upstream.contactsLoaded($0)
    }
  }
}
