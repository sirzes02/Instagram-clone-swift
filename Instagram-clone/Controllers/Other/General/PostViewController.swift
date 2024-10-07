//
//  PostViewController.swift
//  Instagram-clone
//
//  Created by Santiago Varela on 29/09/24.
//

import UIKit

class PostViewController: UIViewController {
    private let model: UserPost?

    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    init(model: UserPost?) {
        self.model = model

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        0
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        0
    }

    func tableView(_: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
