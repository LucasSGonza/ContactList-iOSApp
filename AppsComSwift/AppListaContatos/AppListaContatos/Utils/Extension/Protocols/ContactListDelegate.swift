import Foundation

protocol ContactListDelegate: AnyObject {
    func setContactList(_ contactList:[Contact])
}
