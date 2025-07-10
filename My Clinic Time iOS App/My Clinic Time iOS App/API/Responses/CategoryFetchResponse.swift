//
//  CategoryFetchResponse.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 08/07/2025.
//

import SwiftUI

struct CategoryFetchResponse: Decodable, Equatable {
    let name: String
    let image_url: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "treatment_category_name"
        case image_url = "treatment_category_image_url"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.image_url = try container.decodeIfPresent(String.self, forKey: .image_url)
    }
    
    var body: some View {
        HStack {
            if let url = URL(string: image_url ?? "") {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            }
            
            Text("\(name)")
                .padding(.leading)
            Spacer()
        }
    }
}
