class String

  attr_reader :colors_hash

  @@colors_hash = {
      :red => "31m",
      :green => "32m",
      :yellow => "33m",
      :blue => "34m",
      :pink => "35m",
      :light_blue => "94m",
      :white => "97m",
      :light_grey => "37m",
      :black => "30m"
  }

  def self.colors
    @@colors_hash.keys
  end

  def self.sample_colors
    @@colors_hash.each do |color, format|
      puts "I am " + "#{color}".send("#{color.to_s}") + "."
    end
  end

  def self.create_colors
    @@colors_hash.each do |color, format|
      self.send(:define_method, "#{color}") do
          return "\e[#{format}#{self}\e[0m"
      end
    end
  end
  self.create_colors

end

