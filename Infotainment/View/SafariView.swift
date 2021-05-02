//
//  SafariView.swift
//  Infotainment
//
//  Created by Denny Feng on 5/1/21.
//

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
  
    let url: URL
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: self.url)
        return safariVC
    }
  
}

