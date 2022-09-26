//
//  ContentView.swift
//  QrScan
//
//  Created by utku enes alagöz on 24.09.2022.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "QR code tarama uygulaması"
    var scannerSheet: some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
                
            }
        )
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            Text(scannedCode)
            Button("QR kod tara.") {
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
            
        }
          }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
