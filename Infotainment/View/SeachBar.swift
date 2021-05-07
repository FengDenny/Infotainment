//
//  SeachBar.swift
//  Infotainment
//
//  Created by Denny Feng on 5/2/21.
//

import SwiftUI
extension UISearchBar {
    var textField: UITextField? {
        if #available(iOS 13.0, *) {
            return self.searchTextField
        } else {
            // Fallback on earlier versions
            for view in (self.subviews[0]).subviews {
                if let textField = view as? UITextField {
                    return textField
                }
            }
        }
        return nil
    }
}

struct SearchBarView: UIViewRepresentable
{
    let placeholder: String
    // pass state
    @Binding var text:String
    
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.placeholder = placeholder
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.delegate = context.coordinator
        searchBar.barTintColor = UIColor(Color.primaryDarkBackground)
        searchBar.textField?.font = UIFont.systemFont(ofSize: 20)
        

       
        return searchBar
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: self.$text)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate
    {
        @Binding var text: String
        init(text: Binding<String>)
        {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.text = searchText
           
            
            
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            
        }
        
        
    }
    
    
    
    
    
}

