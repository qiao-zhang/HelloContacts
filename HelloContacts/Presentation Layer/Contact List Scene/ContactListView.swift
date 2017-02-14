//
//  ContactListView.swift
//  HelloContacts
//
//  Created by Qiao Zhang on 2/13/17.
//  Copyright © 2017 Qiao Zhang. All rights reserved.
//

import UIKit

protocol ContactListView: class {
}

class ContactListViewController: UIViewController, ContactListView {
  
  var presenter: ContactListPresenter!

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewLoaded()
  }

}

