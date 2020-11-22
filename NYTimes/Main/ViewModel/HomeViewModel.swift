//
//  HomeViewModel.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import Foundation

final class HomeViewModel: ViewModelProtocol {
    
    // MARK: - RX Vars
    
    /// This variable is used to: observe loading state
    let loading: PublishSubject<Bool> = PublishSubject()
    
    /// This variable is used to: observe reloading collection view with animation or no
    let reloadAnimated: PublishSubject<Bool> = PublishSubject()
    
    /// This variable is used to: observe error state
    let error: PublishSubject<String> = PublishSubject()
    
    /// This variable is used to: observe available data state, offline or online
    let data: PublishSubject<[ResultModel]> = PublishSubject()
    
    // MARK: - ------------------------------- GET DATA ----------------------------------
    func getData(fromRefresh: Bool) {
        self.loading.onNext(!fromRefresh)
        Utils.delay(delay: 0.1) {
            
            // Tell if we want to wait a little to fetch new data
            var delayValue = 0.0
            
            // Tell if we want the table view to reload with animation or to avoide UI glitches
            var reloadWithAnimation = true
            
            // Check if we are not refreshing data, means we've just launched the app.
            if !fromRefresh {
                /**
                 Check if we have cached data
                 If yes, fill and reload
                 */
                let array = ArticleEntity.fetchCached()
                if array.count > 0 {
                    var temp = [ResultModel]()
                    for item in array {
                        temp.append(ResultModel.createCachedModel(byline: item.byline ?? "", title: item.title ?? "", id: item.id, publishedDate: item.publishedDate ?? "", imageURL: item.imageURL ?? ""))
                    }
                    self.data.onNext(temp)
                    self.reloadAnimated.onNext(reloadWithAnimation)
                    reloadWithAnimation = false
                    delayValue = 0.5
                }
            }
            
            /**
             Fetch news data, cache them and reload
             */
            Utils.delay(delay: delayValue) {
                Services.getNews(section: .all, period: .thirtyDays) { (error, data) in
                    self.loading.onNext(false)
                    if error == nil {
                        self.data.onNext(data ?? [])
                        self.reloadAnimated.onNext(reloadWithAnimation)
                    } else {
                        self.error.onNext(error!)
                    }
                }
            }
        }
    }
}
