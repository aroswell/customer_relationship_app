# Defining a class with methods that allow for colour output

class String

  # method to change the text colour
  def colorize(colour_code)
    "\e[#{colour_code}m#{self}\e[0m"
  end

  def black
    colorize(30)
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def magenta
    colorize(35)
  end

  def cyan
    colorize(36)
  end

  def light_grey
    colorize(37)
  end

  def dark_grey
    colorize(90)
  end

  # methods to change the text background
  def background_colour(colour_code)
    "\e[#{colour_code}m#{self}"
  end

  def yellow_background
    background_colour(43)
  end

  # methods to apply text features
  def bold
    "\e[1m#{self}"
  end

  def underline
    "\e[4m#{self}"
  end

  def hidden
    "\e[8m#{self}"
  end

  def dim
    "\e[2m#{self}"
  end

  # method to handle long string of contact info
  def format_contact_info_red
    self.gsub(
      /First name:/, "First name:".red
    ).gsub(
    /Last name:/, "Last name:".red
    ).gsub(
    /Email:/, "Email:".red
    ).gsub(
    /Notes:/, "Notes:".red
    ).gsub(
    /I.D.:/, "I.D.:".red)
  end

  def format_contact_info_magenta
    self.gsub(
      /First name:/, "First name:".magenta
    ).gsub(
    /Last name:/, "Last name:".magenta
    ).gsub(
    /Email:/, "Email:".magenta
    ).gsub(
    /Notes:/, "Notes:".magenta
    ).gsub(
    /I.D.:/, "I.D.:".magenta)
  end

  def format_contact_info_yellow(attribute = false)
    case attribute
    when 1
      self.gsub(/First name:/, "First name:".yellow)
    when 2
      self.gsub(/Last name:/, "Last name:".yellow)
    when 3
      self.gsub(/Email:/, "Email:".yellow)
    when 4
      self.gsub(/Notes:/, "Notes:".yellow)
    else
      self.gsub(
        /First name:/, "First name:".yellow
      ).gsub(
      /Last name:/, "Last name:".yellow
      ).gsub(
      /Email:/, "Email:".yellow
      ).gsub(
      /Notes:/, "Notes:".yellow
      ).gsub(
      /I.D.:/, "I.D.:".yellow)
    end
  end

end

def add_formatting(array_of_text, colour_code)
  contact_string = []
  array_of_text.each do |str|
    contact_string << str.gsub(
      /First name:/,
      "\e[#{colour_code}mFirst name:\e[0m"
    ).gsub(
    /Last name:/,
    "\e[#{colour_code}mLast name:\e[0m"
    ).gsub(
    /Email:/,
    "\e[#{colour_code}mEmail:\e[0m"
    ).gsub(/Notes:/, "\e[#{colour_code}mNotes:\e[0m"
    ).gsub(/I.D.:/, "\e[#{colour_code}mI.D.:\e[0m")
  end
  return contact_string
end
