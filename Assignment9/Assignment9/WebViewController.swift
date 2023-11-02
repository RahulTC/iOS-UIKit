//
//  WebViewController.swift
//  Assignment9
//
//  Created by Rahul Adepu on 11/1/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var isCorrectWebsite = false
    
    var websites = ["pokemon.com", "apple.com"]
    @IBOutlet weak var pokemonDataWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        pokemonDataWebView.navigationDelegate = self
        loadUrlInWebView()
    }
    func loadUrlInWebView(){
        guard let url = URL(string: "https://www.pokemon.com/us/pokedex") else {return}
//        guard let url = URL(string: "https://www.apple.com") else {return}
//        guard let url = URL(string: "https://www.amazon.com/") else {return}
        let request = URLRequest(url: url)
        pokemonDataWebView.load(request)
    }
    
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let url = navigationAction.request.url
        
        if let host = url?.host {
            for website in websites{
//                print("Host ->",host)
//                print("Website ->",website)
//                print("What is it?",host.contains(website))
                if host.contains(website){
                    isCorrectWebsite = true
                    decisionHandler(.allow)
                    return
                }
            }
        }
        
        decisionHandler(.cancel)
        
        if !isCorrectWebsite {
            let alertViewController = UIAlertController(title: "Wrong Website", message: "You tried to open a restricted website", preferredStyle: .alert)
            alertViewController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alertViewController, animated: true)
        }
    }
}
