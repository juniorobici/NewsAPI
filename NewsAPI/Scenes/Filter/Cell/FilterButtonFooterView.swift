//
//  FilterButtonFooterView.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

protocol FilterButtonDelegate: AnyObject {
    func applySelectedFilter()
}

class FilterButtonFooterView: UIView {
    
    //MARK: - Properties
    weak var delegate: FilterButtonDelegate?
    
    private lazy var buttonApply: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.main
        button.setTitle("Aplicar filtro", for: .normal)
        button.titleLabel?.font = NewsFont.poppinsBold(ofSize: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 8
        button.accessibilityIdentifier = "applyFilterButton"
        button.addTarget(self, action: #selector(applyFilter), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(buttonApply)
        buttonApply.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    @objc func applyFilter() {
        delegate?.applySelectedFilter()
    }
    
}
