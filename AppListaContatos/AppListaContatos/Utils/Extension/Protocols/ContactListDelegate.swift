import Foundation

protocol ContactListDelegate: AnyObject {
    func setContactList(_ contactList:[Contact])
}

protocol EditContactDelegate:AnyObject {
    func goToEditContact(_ contact:Contact)
}
