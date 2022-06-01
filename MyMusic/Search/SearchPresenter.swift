//
//  SearchPresenter.swift
//  MyMusic
//
//  Created by Max Pavlov on 31.05.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
    func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
    weak var viewController: SearchDisplayLogic?
    
    func presentData(response: Search.Model.Response.ResponseType) {
        
        switch response {
        case .some:
            print("presenter .some")
        case .presentTracks:
            print("presenter .presenterTracks")
            viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayTracks)
        }
    }
    
}
