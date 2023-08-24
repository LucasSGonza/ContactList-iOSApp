import Foundation

protocol ContactListDelegate: AnyObject {
    func setContactList(_ contactList:[Contact])
}

protocol EditContactListener:AnyObject {
    func goToEditContact(_ contact:Contact)
}
