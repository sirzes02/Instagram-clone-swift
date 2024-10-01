//
//  EditProfileViewController.swift
//  Instagram-clone
//
//  Created by Santiago Varela on 29/09/24.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                           target: self,
                                                           action: nil)
    }
    
    @objc private func didTapSave() {
        
    }
    
    @objc private func didTapCancel() {
        
    }
    
    @objc private func didTapChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "Change Profile Picture",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take photo", style: .default) { _ in
        })
        actionSheet.addAction(UIAlertAction(title: "Choosen from Library", style: .default) { _ in
        })
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }
    
}
