class View
  def display(contacts)
    contacts.each_with_index do |contact, index|
      puts "#{index + 1}. #{contact.name} #{contact.email} #{contact.note}"
    end
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end

  def ask_user_for_index
    puts "Index?"
    print "> "
    return gets.chomp.to_i - 1
  end

end