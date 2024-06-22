//
//  ReusableView.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/22/24.
//

import Foundation
import UIKit

extension UITableView {
  func lastIndexpath() -> IndexPath? {
    
    if numberOfSections > 0 {
      let section = max(numberOfSections - 1, 0)
      let row = max(numberOfRows(inSection: section) - 1, 0)
      let index = IndexPath(row: row, section: section)
      return index
    } else {
      return nil
    }
  }
  
  func lastVisibleCell() -> IndexPath? {
    let index = indexPathsForVisibleRows?.last
    return index
  }
  
  func isTableAtLastPosition() -> Bool {
    let result = lastIndexpath() == lastVisibleCell()
    return result
  }
  
  func isCellVisible(indexPath: IndexPath) -> Bool {
    guard let indexes = self.indexPathsForVisibleRows else {
      return false
    }
    return indexes.contains {$0.section == indexPath.section && $0.row == indexPath.row }
  }
}


extension UITableView {
  
  func setTopInset(to value: CGFloat) {
    let edgeInset = UIEdgeInsets(top: value, left: 0, bottom: 0, right: 0)
    
    self.contentInset = edgeInset
    self.scrollIndicatorInsets = edgeInset
  }
  
  func setInset(top: CGFloat = 0, bottom: CGFloat = 0, left: CGFloat = 0, right: CGFloat = 0) {
    let edgeInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    
    self.contentInset = edgeInset
    self.scrollIndicatorInsets = edgeInset
  }
}

extension UITableView
{
  func indexPathExists(indexPath:IndexPath) -> Bool {
    if indexPath.section >= self.numberOfSections {
      return false
    }
    if indexPath.row >= self.numberOfRows(inSection: indexPath.section) {
      return false
    }
    return true
  }
}


extension UITableView {
  func selectRows(at indexPaths: [IndexPath], animated: Bool = false) {
    for indexPath in indexPaths {
      selectRow(at: indexPath, animated: animated, scrollPosition: .none)
    }
  }
  
  func deselectRows(at indexPaths: [IndexPath], animated: Bool = false) {
    for indexPath in indexPaths {
      deselectRow(at: indexPath, animated: animated)
    }
  }
}
