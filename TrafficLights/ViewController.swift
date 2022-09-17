//
//  ViewController.swift
//  TrafficLights
//
//  Created by Илья Дубенский on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var startButton: UIButton!

    //MARK: Private properties
    private enum CurrentLight {
        case red, yellow, green
    }
    
    private var currentLight = CurrentLight.red
    private let lightOff: CGFloat = 0.3
    private let lightOn: CGFloat  = 1

    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.layer.cornerRadius = 10

        redLightView.layer.cornerRadius = 50
        yellowLightView.layer.cornerRadius = 50
        greenLightView.layer.cornerRadius = 50

        greenLightView.alpha = lightOff
        redLightView.alpha = lightOff
        yellowLightView.alpha = lightOff
    }

    @IBAction func lightsSwitchButton() {
        startButton.setTitle("Next", for: .normal)

        switch currentLight {
        case .red:
            redLightView.alpha = lightOn
            yellowLightView.alpha = lightOff
            greenLightView.alpha = lightOff
            currentLight = .yellow
        case .yellow:
            redLightView.alpha = lightOff
            yellowLightView.alpha = lightOn
            greenLightView.alpha = lightOff
            currentLight = .green
        case .green:
            redLightView.alpha = lightOff
            yellowLightView.alpha = lightOff
            greenLightView.alpha = lightOn
            currentLight = .red
        }
    }
}

