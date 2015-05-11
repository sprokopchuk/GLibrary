module GLibrary
  class Reader
    def initialize(name, email, city, street, house)
      @name, @email, @city, @street, @house = name, email, city, street, house
    end

    attr_accessor :name, :email, :city, :street, :house

    def ==(other)
      @name == other.name && @email == other.email && @city == other.city && @street == other.street && @house == other.house
    end
  end
end
