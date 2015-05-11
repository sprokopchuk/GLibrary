module GLibrary
  class Book
    def initialize(title, author)
      raise TypeError, author unless author.instance_of? Author
      @title, @author = title, author.name
    end

    attr_reader :title, :author

    def ==(other)
      @title == other.title && @author == other.author
    end
  end
end
