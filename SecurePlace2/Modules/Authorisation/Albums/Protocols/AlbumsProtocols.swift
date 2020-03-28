//
//  AlbumsProtocols.swift
//  SecurePlace2
//
//  Created by YY on 25/12/2019.
//  Copyright © 2019 Security Inc.. All rights reserved.
//

import UIKit

protocol AlbumsViewProtocol: class {
    func showAddActionSheet()
}

protocol AlbumsWireFrameProtocol: class {
}

protocol AlbumsPresenterProtocol: class {
    func addButtonClicked()
}

protocol AlbumsInteractorProtocol: class { }
