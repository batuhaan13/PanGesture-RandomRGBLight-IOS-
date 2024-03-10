//
//  ViewController.swift
//  panGesture
//
//  Created by Batu on 13.11.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed { // Gesture başladığında veya vdeğiştiğinde bu blok çalışır.
            let translation = sender.translation(in: self.view) // Hareketin görünümdeki çevirisini alır.
            let changeX = (sender.view?.center.x)! + translation.x // Yeni X pozisyonunu hesaplar.
            let changeY = (sender.view?.center.y)! + translation.y // Yeni Y pozisyonunu hesaplar.
            sender.view?.center = CGPoint(x: changeX, y: changeY) // Görünümün merkezini yeni pozisyona taşır.
            sender.setTranslation(CGPoint.zero, in: sender.view) // Gesture'nın çeviri değerini sıfırlar.
            sender.view?.backgroundColor = randomColor() // Sürüklenen görünümün arkaplan rengini rastgele bir renge değiştirir.
            self.view.backgroundColor = randomColor() // Ana görünümün arkaplan rengini rastgele bir renge değiştirir.
        }
    }
    
    func randomColor() -> UIColor { // Rastgele bir renk üretir.
        let red = CGFloat(arc4random_uniform(256)) / 255 // Kırmızı renk için 0 ila 255 arasında rastgele bir değer üretir ve 255'e böler
        let green = CGFloat(arc4random_uniform(256)) / 255 // Yeşil renk için 0 ila 255 arasında rastgele bir değer üretir ve 255'e böler
        let blue = CGFloat(arc4random_uniform(256)) / 255 // Mavi renk için 0 ila 255 arasında rastgele bir değer üretir ve 255'e böler
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0) // RGBA değerlerini kullanarak yeni bir UIColor nesnesini oluşturur.
        
    }
}

