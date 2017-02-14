//
// Created by Qiao Zhang on 2/13/17.
// Copyright (c) 2017 Qiao Zhang. All rights reserved.
//

import Foundation

protocol ContactListPresenterView: class {
  
}

class ContactListPresenter: ContactListViewControllerEventHandler,
    ContactInteractorUpstream {
  var contactInteractor: ContactInteractor!
  unowned let upstream: ContactListPresenterView

  init(upstream: ContactListPresenterView) {
    self.upstream = upstream
  }

  func viewLoaded() {
    contactInteractor.retrieveContacts()
  }

  func contactsLoaded(_ contacts: [Contact]?) {
    print("Before printing contacts...")
    if let contacts = contacts {
      print(contacts)
    } else {
      print("No contacts")
    }
  }
}
