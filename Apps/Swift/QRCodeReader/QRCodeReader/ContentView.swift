//
//  ContentView.swift
//  QRCodeReader
//
//  Created by Gustavo Tavares on 08.03.20.
//  Copyright © 2020 Gustavo Tavares. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var showReader: Bool = false
    
    var body: some View {
        Button(action: { self.showReader.toggle() }) {
            Text("Open QR Code Reader")
        }.sheet(isPresented: $showReader) {
            ScannerViewController()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
