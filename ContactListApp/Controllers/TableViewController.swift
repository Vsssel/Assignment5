import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, ContactDelegate {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var search: UITextField!
    
    var contacts: [Contact] = [
        Contact(name: "Assel", phone: "2345678987654"),
        Contact(name: "Jason", phone: "2345678987654"),
        Contact(name: "Medat", phone: "2345678987654"),
        Contact(name: "Diana", phone: "2345678987654"),
        Contact(name: "Bella", phone: "2345678987654"),
        Contact(name: "Harry", phone: "2345678987654"),
        Contact(name: "Ron", phone: "2345678987654"),
        Contact(name: "Brandon", phone: "2345678987654"),
        Contact(name: "Stella", phone: "2345678987654"),
        Contact(name: "Bloom", phone: "2345678987654"),
        Contact(name: "Smith", phone: "2345678987654"),
        Contact(name: "Bruno", phone: "2345678987654")
    ]
    
    var filteredData = [Contact]()
    var selectedContact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        search.delegate = self
        table.isScrollEnabled = true
        filteredData = contacts
        addIconToTextField(textField: search, icon: UIImage(systemName: "magnifyingglass")!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedContact = filteredData[indexPath.row]
        performSegue(withIdentifier: "showSingleContact", sender: self)
    }


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let currentText = textField.text,
           let textRange = Range(range, in: currentText) {
            let updatedText = currentText.replacingCharacters(in: textRange, with: string)
            filterText(updatedText)
        }
        return true
    }
    
    func filterText(_ query: String) {
        if query.isEmpty {
            filteredData = contacts
        } else {
            filteredData = contacts.filter { $0.name.lowercased().starts(with: query.lowercased()) }
        }
        table.reloadData()
    }
    
    func addNewContact(_ contact: Contact) {
        contacts.append(contact)
        filteredData = contacts
        table.reloadData()
    }
    
    func addIconToTextField(textField: UITextField, icon: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        iconView.image = icon.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = .black
        iconView.contentMode = .scaleAspectFit
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 24))
        paddingView.addSubview(iconView)
        
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showAddContact", let destinationVC = segue.destination as? AddContactViewController {
                destinationVC.delegate = self
            } else if segue.identifier == "showSingleContact", let destinationVC = segue.destination as? SingleContactViewController {
                if let contact = selectedContact {
                    destinationVC.contact = contact
                }
            }
        }

}
