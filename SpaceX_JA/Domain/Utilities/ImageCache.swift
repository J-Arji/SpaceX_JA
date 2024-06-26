//
//  ImageLoader.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/26/24.
//

import UIKit

//MARK: - ImageCache
actor ImageCache {
    static var shared = ImageCache()
    
    private let imageCache = NSCache<NSString, UIImage>()
    
    init() { }
    
    //MARK: - load
    ///  lead data from cache or network
    ///
    /// - Parameter urlString: The URL for which to load data.
    /// - Parameter placeholder: Task-specific delegate.
    /// - Returns: UIImage
    ///
    func load(with path: String?) async throws -> UIImage {
        guard let urlString = path, let url = URL(string: urlString)
        else { throw DataTransferError.invalidURL }
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            return cachedImage
        }
        
        let (data, responseTempo) = try await URLSession.shared.data(from: url)
        
        guard let response = responseTempo as? HTTPURLResponse
        else { throw DataTransferError.noResponse }
        
        switch response.statusCode {
        case 200..<300:
            guard let image = UIImage(data: data)
            else { throw DataTransferError.unknown("data is wrong") }
            imageCache.setObject(image, forKey: urlString as NSString)
            return image
            
        default:
            throw DataTransferError.unexpectedStatusCode(response.statusCode)
        }
    }
    
}
