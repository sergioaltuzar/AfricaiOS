//
//  AnimalModel.swift
//  Africa
//
//  Created by Sergio Luis Altuzar Morales on 10/03/25.
//

import Foundation

struct Animal: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  let description: String
  let link: String
  let image: String
  let gallery: [String]
  let fact: [String]
}
