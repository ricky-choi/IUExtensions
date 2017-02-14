//
//  PhotosExtension.swift
//  PhotoGPS
//
//  Created by Jae Young Choi on 2016. 5. 11..
//  Copyright © 2016년 Appcid. All rights reserved.
//

import Photos

public enum AssetEditError: Error {
    case editUnavailable
}

#if os(iOS)

extension PHAssetCollection {
    public var assetCount: Int {
        if estimatedAssetCount != NSNotFound {
            return estimatedAssetCount
        } else {
            let fetchResult = PHAsset.fetchAssets(in: self, options: nil)
            return fetchResult.count
        }
    }
}

extension PHAsset {
    public func canEditLocation() -> Bool {
        return canPerform(.properties)
    }
    
    public func edit(location: CLLocation?, completionHandler: ((Bool, Error?) -> Swift.Void)? = nil) {
        guard canEditLocation() else {
            completionHandler?(false, AssetEditError.editUnavailable)
            return
        }
        
        PHPhotoLibrary.shared().performChanges({
            let request = PHAssetChangeRequest(for: self)
            request.location = location
        }) { (success, error) in
            completionHandler?(success, error)
        }
    }
    
    public func deleteLocation(_ completionHandler: ((Bool, Error?) -> Swift.Void)? = nil) {
        edit(location: nil, completionHandler: completionHandler)
    }
}

extension PHPhotoLibrary {
    
    static public func saveImage(_ image: UIImage, toAlbumName albumName: String, completion: @escaping (PHAsset?)->()) {
        if let album = self.findAlbum(albumName) {
            saveImage(image, album: album, completion: completion)
            return
        }
        
        createAlbum(albumName) { album in
            if let album = album {
                self.saveImage(image, album: album, completion: completion)
            }
        }
    }
    
    static fileprivate func saveImage(_ image: UIImage, album: PHAssetCollection, completion: @escaping (PHAsset?)->()) {
        var placeholder: PHObjectPlaceholder?
        PHPhotoLibrary.shared().performChanges({
            
            let createAssetRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
            
            guard let albumChangeRequest = PHAssetCollectionChangeRequest(for: album), let photoPlaceholder = createAssetRequest.placeholderForCreatedAsset else {
                return
            }
            
            placeholder = photoPlaceholder
            albumChangeRequest.addAssets([photoPlaceholder] as NSArray)
            
            }, completionHandler: { success, error in
                guard let placeholder = placeholder, success else {
                    completion(nil)
                    return
                }
                
                completion(PHAsset.fetchAssets(withLocalIdentifiers: [placeholder.localIdentifier], options: nil).firstObject)
        })
    }
    
    static public func findAlbum(_ albumName: String) -> PHAssetCollection? {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
        
        let fetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: fetchOptions)
        
        return fetchResult.firstObject
    }
    
    static public func createAlbum(_ albumName: String, completion: @escaping (PHAssetCollection?)->()) {
        var albumPlaceholder: PHObjectPlaceholder?
        PHPhotoLibrary.shared().performChanges({

            let createAlbumRequest = PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: albumName)
            albumPlaceholder = createAlbumRequest.placeholderForCreatedAssetCollection
            
            }, completionHandler: { success, error in
                guard let placeholder = albumPlaceholder, success else {
                    completion(nil)
                    return
                }
                
                let fetchResult = PHAssetCollection.fetchAssetCollections(withLocalIdentifiers: [placeholder.localIdentifier], options: nil)
                
                completion(fetchResult.firstObject)
        })
    }
    
}
    
#endif

extension PHAssetMediaType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .image:
            return "Image"
        case .video:
            return "Video"
        case .audio:
            return "Audio"
        default:
            return "Unknown"
        }
    }
}
