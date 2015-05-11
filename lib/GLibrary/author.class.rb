module GLibrary
  class Author
    def initialize(name, biography)
      @name, @biography = name, biography
    end

    attr_reader :name, :biography

    def ==(other)
      @name == other.name && @biography == other.biography
    end
  end
end
