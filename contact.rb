class Contact
  attr_reader :name, :email, :note

  def initialize(name, email, note)
    @name = name
    @email = email
    @note = note
  end
end