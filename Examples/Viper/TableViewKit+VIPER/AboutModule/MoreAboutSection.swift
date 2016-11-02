import Foundation
import TableViewKit

class MoreAboutSection: Section {
    
    var items: ObservableArray<Item> = []
    var header: HeaderFooterView = .title("More about eDreams")
    let presenter: AboutPresenterProtocol?
    weak var manager: TableViewManager?
    
    required init(presenter: AboutPresenterProtocol?, manager: TableViewManager?) {
        
        self.presenter = presenter
        self.manager = manager
        
        let moreAction = UITableViewRowAction(style: .normal, title: "More", handler: { action, indexPath in
            print("MoreAction executed")
        })
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete", handler: { action, indexPath in
            self.items.remove(at: indexPath.row)
        })
        
        let types: [MoreAboutItemType] = [.faq, .contact, .terms, .feedback, .share, .rate]
        for type in types {
            let moreAboutItem = MoreAboutItem(type: type)
            moreAboutItem.onSelection = { item in
                
                switch type {
                case .faq:
                    self.presenter?.showFaq()
                case .contact:
                    self.presenter?.showContactUs()
                case .terms:
                    self.presenter?.showTermsAndConditions()
                case .feedback:
                    self.presenter?.showFeedback()
                case .share:
                    self.presenter?.showShareApp()
                case .rate:
                    self.presenter?.showRateApp()
                }
                
                guard let manager = self.manager else { return }
                item.deselect(in: manager, animated: true)
            }
            moreAboutItem.actions = [deleteAction, moreAction]
            items.append(moreAboutItem)
        }
    }
}
