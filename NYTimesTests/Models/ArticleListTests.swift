//
//  ArticleListTests.swift
//
//  Created by Avaneesh on 25/06/22.
//  Copyright © 2022 Avaneesh. All rights reserved.
//



import XCTest
@testable import NYTimes

class ArtisticleListTests: XCTestCase {

	func testSuccessParser() {
        let json =
        """
        {"results": [ {
        "uri": "nyt://article/d13e3d87-8ebe-533d-8e24-9b4c4ff0ea72",
        "url": "https://www.nytimes.com/2021/11/21/us/wisconsin-parade-crash.html",
        "id": 100000008087625,
        "asset_id": 100000008087625,
        "source": "New York Times",
        "published_date": "2021-11-21",
        "updated": "2021-11-22 12:02:10",
        "section": "U.S.",
        "subsection": "",
        "nytdsection": "u.s.",
        "adx_keywords": "Murders, Attempted Murders and Homicides;Parades;Waukesha, Wis, Holiday Parade Attack (2021);Waukesha (Wis)",
        "column": null,
        "byline": "By Dan Simmons, Mitch Smith, Robert Chiarito, Jesus Jiménez and Livia Albeck-Ripka",
        "type": "Article",
        "title": "Five Dead in Wisconsin After Driver Plows S.U.V. Into Holiday Parade",
        "abstract": "Officials said dozens of people were struck after the vehicle sped down the street during the Christmas parade in Waukesha, Wis., near Milwaukee.",
        "des_facet": [
            "Murders, Attempted Murders and Homicides",
            "Parades",
            "Waukesha, Wis, Holiday Parade Attack (2021)"
        ],
        "org_facet": [],
        "per_facet": [],
        "geo_facet": [
            "Waukesha (Wis)"
        ],
        "media": [],
        "eta_id": 0}]}
        """
            .data(using: .utf8)!
		
		let artilces = try! JSONDecoder().decode(ArticlesResponse.self, from: json)
		
		XCTAssertNotNil(artilces)
		XCTAssertEqual(artilces.articles?.first?.id, 100000008087625)
		
	}
}
