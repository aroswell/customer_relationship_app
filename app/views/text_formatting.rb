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

end
