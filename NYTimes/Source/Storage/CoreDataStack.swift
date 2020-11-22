//
//  CoreDataStack.swift
//  riffr
//
//  Created by Fouad Bakour on 8/4/20.
//  Copyright © 2020 Eurisko Mobility. All rights reserved.
//

import Foundation
import CoreData

extension ArticleEntity {
    class func insert(model:ResultModel) {
        guard let moc = CoreDataStore.managedObjectContext else { return }
        let modelID = model.id ?? 0
        
        let fetchRequest: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %lld", modelID)
        
        var item: ArticleEntity?
        if let fetchedItem = try? moc.fetch(fetchRequest).first {
            item = fetchedItem
        } else {
            item = ArticleEntity(context: moc)
        }
        item?.byline = model.byline
        item?.id = modelID
        item?.publishedDate = model.publishedDate
        item?.title = model.title
        
        var imageUrlStr:String?
        for mediaItem in model.media ?? [] {
            for mediaImage in mediaItem.mediaMetadata ?? [] {
                if mediaImage.format == MediaFormat.standardThumbnail {
                    imageUrlStr = mediaImage.url ?? ""
                    break
                }
            }
        }
        if let imageUrlStr = imageUrlStr {
            item?.imageURL = imageUrlStr
        }
        
        appDelegate?.saveContext()
    }
    class func fetchCached() -> [ArticleEntity] {
        guard let moc = CoreDataStore.managedObjectContext else { return []}
        
        let fetchRequest: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
        
        if let results = try? moc.fetch(fetchRequest) {
            return results
        }
        return []
    }
}
