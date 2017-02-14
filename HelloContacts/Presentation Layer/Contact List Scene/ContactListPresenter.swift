//
// Created by Qiao Zhang on 2/13/17.
// Copyright (c) 2017 Qiao Zhang. All rights reserved.
//

import Foundation

protocol ContactListPresenter {
  func viewLoaded()
}

class ContactListPresenterImp: ContactListPresenter, ContactInteractorUpstream {
  var contactInteractor: ContactInteractor!
  unowned let view: ContactListView

  init(view: ContactListView) {
    self.view = view
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
