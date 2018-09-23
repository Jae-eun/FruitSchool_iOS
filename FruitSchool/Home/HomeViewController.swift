//
//  HomeViewController.swift
//  FruitSchool
//
//  Created by Presto on 2018. 9. 17..
//  Copyright © 2018년 YAPP. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let cellIdentifier = "homeCell"
    @IBOutlet weak var idiomStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "topLogo"))
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let ud = UserDefaults.standard
        if ud.bool(forKey: "TUTORIAL") == false {
            let vc = self.instanceTutorialVC(name: "TutorialViewController")
            self.present(vc!, animated: false)
            return
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HomeCell else { return UITableViewCell() }
        let stampImageView = UIImageView(image: #imageLiteral(resourceName: "topLogo"))
        cell.accessoryView = stampImageView
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
