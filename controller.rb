require_relative "view"
require_relative "contact"

class Controller
  def initialize(tracker)
    @tracker = tracker
    @view = View.new
  end 

  def list
    display_contacts
  end

  def create
    # 1. Ask user for a name (view)
    name = @view.ask_user_for("name")
    # 2. Ask user for a email (view)
    email = @view.ask_user_for("email")
    # 2. Ask user for a note (view)
    note = @view.ask_user_for("note")
    # 4. Create contact (model)
    contact = Contact.new(name, email, note)
    # 4. Store in tracker (repo)
    @tracker.add_contact(contact)
    # 5. Display
    display_contacts
  end

  def destroy
    # 1. Display contacts
    display_contacts
    # 2. Ask user for index (view)
    index = @view.ask_user_for_index
    # 3. Remove from tracker (repo)
    @tracker.remove_contact(index)
    # 4. Display
    display_contacts
  end

  private

  def display_contacts
    # 1. Get contacts (repo)
    contacts = @tracker.all
    # 2. Display contacts in the terminal (view)
    @view.display(contacts)
  end
end
