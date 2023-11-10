//
//  UIView+Pin.swift
//  IOSsem_2
//
//  Created by Мария Беликова on 22.09.2023.
//

import UIKit

extension UIView {
    enum ConstraintMode {
        case equal
        case grOE // greaterOrEqual
        case lsOE // lessOrEqual
    }
    
    // MARK: - Pin left
    @discardableResult
    func pinLeft(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, leadingAnchor, otherView.leadingAnchor, constant: const)
    }
    
    @discardableResult
    func pinLeft(
        to anchor: NSLayoutXAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, leadingAnchor, anchor, constant: const)
    }
    
    // MARK: - Pin right
    @discardableResult
    func pinRight(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, trailingAnchor, otherView.trailingAnchor, constant: -1 * const)
    }
    
    @discardableResult
    func pinRight(
        to anchor: NSLayoutXAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, trailingAnchor, anchor, constant: -1 * const)
    }
    
    // MARK: - Pin top
    @discardableResult
    func pinTop(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, topAnchor, otherView.topAnchor, constant: const)
    }
    
    @discardableResult
    func pinTop(
        to anchor: NSLayoutYAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, topAnchor, anchor, constant: const)
    }
    
    // MARK: - Pin bottom
    @discardableResult
    func pinBottom(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, bottomAnchor, otherView.bottomAnchor, constant: -1 * const)
    }
    
    @discardableResult
    func pinBottom(
        to anchor: NSLayoutYAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, bottomAnchor, anchor, constant: -1 * const)
    }
    
    // MARK: - Pin center
    func pinCenter(to otherView: UIView) {
        pinConstraint(mode: .equal, centerXAnchor, otherView.centerXAnchor)
        pinConstraint(mode: .equal, centerYAnchor, otherView.centerYAnchor)
    }
    
    @discardableResult
    func pinCenterX(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, centerXAnchor, otherView.centerXAnchor, constant: const)
    }
    
    @discardableResult
    func pinCenterX(
        to anchor: NSLayoutXAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, centerXAnchor, anchor, constant: const)
    }
    
    @discardableResult
    func pinCenterY(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, centerYAnchor, otherView.centerYAnchor, constant: const)
    }
    
    @discardableResult
    func pinCenterY(
        to anchor: NSLayoutYAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, centerYAnchor, anchor, constant: const)
    }
    
    // MARK: - Pin width
    @discardableResult
    func pinWidth(
        to otherView: UIView,
        _ mult: Double = 1,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: .equal, widthAnchor, otherView.widthAnchor, multiplier: mult)
    }
    
    @discardableResult
    func pinWidth(
        to anchor: NSLayoutDimension,
        _ mult: Double = 1,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: .equal, widthAnchor, anchor, multiplier: mult)
    }
    
    // MARK: - Pin height
    @discardableResult
    func pinHeight(
        to otherView: UIView,
        _ mult: Double = 1,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: .equal, heightAnchor, otherView.heightAnchor, multiplier: mult)
    }
    
    @discardableResult
    func pinHeight(
        to anchor: NSLayoutDimension,
        _ mult: Double = 1,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: .equal, heightAnchor, anchor, multiplier: mult)
    }
    
    // MARK: - Set width
    @discardableResult
    func setWidth(
        mode: ConstraintMode = .equal,
        _ const: Double = 0
    ) -> NSLayoutConstraint {
        pinDimension(mode: mode, widthAnchor, constant: const)
    }
    
    // MARK: - Set height
    @discardableResult
    func setHeight(
        mode: ConstraintMode = .equal,
        _ const: Double = 0
    ) -> NSLayoutConstraint {
        pinDimension(mode: mode, heightAnchor, constant: const)
    }
    
    // MARK: - Pin utilities
    func pinHorizontal(
        to otherView: UIView,
        _ const: Double = 0,
        mode: ConstraintMode = .equal
    ) {
        pinLeft(to: otherView, const, mode)
        pinRight(to: otherView, const, mode)
    }
    
    func pinVertical(
        to otherView: UIView,
        _ const: Double = 0,
        mode: ConstraintMode = .equal
    ) {
        pinTop(to: otherView, const, mode)
        pinBottom(to: otherView, const, mode)
    }
    
    func pin(to otherView: UIView, _ const: Double = 0) {
        pinVertical(to: otherView, const)
        pinHorizontal(to: otherView, const)
    }
    
    // MARK: - Private methods
    @discardableResult
    private func pinConstraint<Axis: AnyObject, AnyAnchor: NSLayoutAnchor<Axis>>(
        mode: ConstraintMode,
        _ firstConstraint: AnyAnchor,
        _ secondConstraint: AnyAnchor,
        constant: Double = 0
    ) -> NSLayoutConstraint {
        let const = CGFloat(constant)
        let result: NSLayoutConstraint
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch mode {
        case .equal:
            result = firstConstraint.constraint(equalTo: secondConstraint, constant: const)
        case .grOE:
            result = firstConstraint.constraint(greaterThanOrEqualTo: secondConstraint, constant: const)
        case .lsOE:
            result = firstConstraint.constraint(lessThanOrEqualTo: secondConstraint, constant: const)
        }
        
        result.isActive = true
        return result
    }
    
    @discardableResult
    private func pinConstraint(
        mode: ConstraintMode,
        _ firstConstraint: NSLayoutDimension,
        _ secondConstraint: NSLayoutDimension,
        multiplier: Double = 1
    ) -> NSLayoutConstraint {
        let mult = CGFloat(multiplier)
        let result: NSLayoutConstraint
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch mode {
        case .equal:
            result = firstConstraint.constraint(equalTo: secondConstraint, multiplier: mult)
        case .grOE:
            result = firstConstraint.constraint(greaterThanOrEqualTo: secondConstraint, multiplier: mult)
        case .lsOE:
            result = firstConstraint.constraint(lessThanOrEqualTo: secondConstraint, multiplier: mult)
        }
        
        result.isActive = true
        return result
    }
    
    @discardableResult
    private func pinDimension(
        mode: ConstraintMode,
        _ dimension: NSLayoutDimension,
        constant: Double = 0
    ) -> NSLayoutConstraint {
        let const = CGFloat(constant)
        let result: NSLayoutConstraint
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch mode {
        case .equal:
            result = dimension.constraint(equalToConstant: const)
        case .grOE:
            result = dimension.constraint(greaterThanOrEqualToConstant: const)
        case .lsOE:
            result = dimension.constraint(lessThanOrEqualToConstant: const)
        }
        
        result.isActive = true
        return result
    }
}
