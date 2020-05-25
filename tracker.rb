require "csv"
require_relative "contact"

class Tracker
  def initialize(csv_file)
    @contacts = []
    @csv_file = csv_file
    load_csv
  end

  def add_contact(contact)
    @contacts << contact
    save_to_csv
  end

  def remove_contact(index)
    @contacts.delete_at(index)
    save_to_csv
  end

  def all
    return @contacts
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      @contacts << Contact.new(row[0], row[1], row[2])
    end
  end

  def save_to_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @contacts.each do |contact|
        csv << [contact.name, contact.email, contact.note]
      end
    end
  end

end