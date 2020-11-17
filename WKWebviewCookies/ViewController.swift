//
//  ViewController.swift
//  WKWebviewCookies
//
//  Created by Christina S on 11/11/20.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    lazy var webView: WKWebView = {
        let cookie = HTTPCookie(properties: [
            .domain: "github.com",
            .path: "/",
            .name: "MyCookieName",
            .value: "MyCookieValue",
            .secure: "TRUE",
            .expires: NSDate(timeIntervalSinceNow: 31556926)
        ])!
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.websiteDataStore.httpCookieStore.setCookie(cookie)
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        webView.navigationDelegate = self
        let request = URLRequest(url: URL(string: "https://github.com/Tealium/tealium-swift/blob/master/tealium-swift.podspec")!)
        webView.load(request)
        printCookies("Before")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            TealiumHelper.shared.start()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.printCookies("After")
                let request = URLRequest(url: URL(string: "https://github.com/Tealium/tealium-swift/blob/master/tealium-swift.podspec")!)
                self.webView.load(request)
            }
        }
        
    }

    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            webView.bottomAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            webView.rightAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    private func printCookies(_ beforeOrAfter: String? = nil) {
        if let beforeOrAfter = beforeOrAfter {
            print("🍪🍪 \(beforeOrAfter) Tealium loads 🍪🍪")
        }
        WKWebsiteDataStore.default().httpCookieStore.getAllCookies { cookies in
            cookies.forEach {
                print("🍪 Cookie name: \($0.name)")
                print("🍪 Cookie value: \($0.value)")
                
            }
        }
    }

}

extension ViewController: WKNavigationDelegate {
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        WKWebsiteDataStore.default().httpCookieStore.getAllCookies { cookies in
//            cookies.forEach {
//                print("🍪 Cookie name: \($0.name)")
//                print("🍪 Cookie value: \($0.value)")
//
//            }
//        }
    }
    
}
