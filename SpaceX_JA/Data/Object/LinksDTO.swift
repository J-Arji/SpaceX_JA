//
//  LinksDTO.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

// MARK: - LinksDTO
/// This object is part of DocsDTO
extension LaunchesDTO.DocsDTO {
    struct LinksDTO: Decodable {
        let patch : PatchDTO?
        let reddit : RedditDTO?
        let flickr : FlickrDTO?
        let presskit : String?
        let webcast : String?
        let youtubeId : String?
        let article : String?
        let wikipedia : String?

        enum CodingKeys: String, CodingKey {

            case patch
            case reddit
            case flickr
            case presskit
            case webcast
            case youtubeId = "youtube_id"
            case article
            case wikipedia
        }
    }
    
    
    // MARK: - PatchDTO
    /// This object is part of LinksDTO
    struct PatchDTO : Decodable {
        let small : String?
        let large : String?
    }
    
    // MARK: - PatchDTO
    /// This object is part of LinksDTO
    struct RedditDTO : Decodable {
        let campaign : String?
        let launch : String?
        let media : String?
        let recovery : String?
    }
    
    // MARK: - FlickrDTO
    /// This object is part of LinksDTO
    struct FlickrDTO : Decodable {
        let small : [String]?
        let original : [String]?

    }
}
