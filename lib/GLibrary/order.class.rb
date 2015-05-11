module GLibrary
  class Order
    def initialize(book, reader)
      raise TypeError, reader unless reader.instance_of? Reader
      raise TypeError, book unless book.instance_of? Book
      @book, @reader, @date = book.title, reader.name, Time.now.strftime('%d-%m-%Y')
    end

    attr_reader :book, :reader, :date
  end
end
