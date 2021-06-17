//
//  ContentView.swift
//  Shared
//
//  Created by Damiaan on 17/06/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		List {
			OutlineGroup([Item(path: [], number: 10)], children: \.children) { item in
				Text(item.pathString)
			}
		}
    }
}

struct Item: Identifiable {
	let path: [UInt8]
	let number: UInt8

	var children: [Item]? {
		print("get children of", pathString)
		guard number != 0 else { return nil }
		return (0..<number).map{ Item(path: id, number: $0) }
	}

	var id: [UInt8] { path + [number] }
	var pathString: String {
		id.map(String.init).joined(separator: ".")
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
