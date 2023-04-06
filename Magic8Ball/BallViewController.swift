//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Леонид Турко on 06.04.2023.
//

import UIKit
import SwiftUI
import SnapKit

class BallViewController: UIViewController {
  //  MARK: - Private Properties
  private lazy var askLabel: UILabel = {
    let element = UILabel()
    element.text = "Ask Me Anything..."
    element.textAlignment = .center
    element.numberOfLines = 0
    element.font = UIFont.boldSystemFont(ofSize: 30)
    element.textColor = .white
    return element
  }()
  
  private lazy var askImage: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "ball1")
    
    return element
  }()
  
  private lazy var askButton: UIButton = {
    let element = UIButton(type: .system)
    element.setTitle("Ask", for: .normal)
    element.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    element.backgroundColor = .white
    element.tintColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
    return element
  }()
  
  private lazy var stackView: UIStackView = {
    let element = UIStackView()
    element.axis = .vertical
    element.spacing = 60
    element.distribution = .fill
    return element
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
    addViews()
    addConstraints()
  }
}

//  MARK: -  Private Methods
extension BallViewController {
  private func addViews() {
    view.addSubview(stackView)
    stackView.addArrangedSubview(askLabel)
    stackView.addArrangedSubview(askImage)
    view.addSubview(askButton)
    
  }
  
  private func addConstraints() {
    stackView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().inset(120)
    }
    
    askButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(stackView.snp.bottom).offset(60)
      make.width.equalTo(100)
    }
  }
}

struct ContentViewController: UIViewControllerRepresentable {

    typealias UIViewControllerType = BallViewController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        return BallViewController()
    }

    func updateUIViewController(_ uiViewController: BallViewController, context: Context) {}
}

struct ContentViewController_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewController()
            .edgesIgnoringSafeArea(.all)
            .colorScheme(.light) // or .dark
    }
}
