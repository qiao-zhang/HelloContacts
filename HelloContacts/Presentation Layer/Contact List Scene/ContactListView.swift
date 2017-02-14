//
//  ContactListView.swift
//  HelloContacts
//
//  Created by Qiao Zhang on 2/13/17.
//  Copyright © 2017 Qiao Zhang. All rights reserved.
//

import UIKit

protocol ContactListViewControllerEventHandler {
  func viewLoaded()
}

class ContactListViewController: UIViewController,
    ContactListPresenterView {
  
  var eventHandler: ContactListViewControllerEventHandler!

  override func viewDidLoad() {
    super.viewDidLoad()
    eventHandler.viewLoaded()
  }

}

