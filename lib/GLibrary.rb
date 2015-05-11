require 'GLibrary/book.class'
require 'GLibrary/reader.class'
require 'GLibrary/order.class'
require 'GLibrary/author.class'
require 'GLibrary/version'

module GLibrary

  class Library

    def initialize(f = 'library.dat')
      if File.exists?(f)
        lib = Marshal.load(File.open(f))
        @books, @readers, @orders, @authors = lib.books, lib.readers, lib.orders, lib.authors
      else
       @books, @readers, @orders, @authors = [], [], [], []
     end
    end

    attr_reader :books, :readers, :orders, :authors

    def <<(obj)
      type = obj.class
      case
        when type == Book
          @books << obj unless @books.include?(obj)
        when type == Reader
          @readers << obj unless @readers.include?(obj)
        when type == Order
          @orders << obj unless @orders.include?(obj)
        when type == Author
          @authors << obj unless @authors.include?(obj)
        else
          "Wrong object"
        end
    end

    def fan_book(book)
      raise TypeError, book unless book.instance_of? Book
      readers_book = []
      orders.each do |order|
        readers_book << order.reader if order.book == book.title
      end
      readers_book.max_by {|x| readers_book.count(x) }
    end

    def most_popular_book
      title_books = []
      orders.each { |order| title_books << order.book }
      title_books.max_by {|x| title_books.count(x) }
    end

    def num_readers_most_popular_books(num = 3)
      title_books, readers_books, popular_books = [], [], {}
      orders.each do |order|
        title_books << order.book
        readers_books << [order.book, order.reader]
      end
      num.times do
        title_book = title_books.max_by {|x| title_books.count(x) }
        popular_books[title_book] = readers_books.select{|reader| reader[0] == title_book }.uniq.count
        title_books.delete_if {|i| i == title_book}
      end
      key = popular_books.keys.sample
      "The book \"#{key}\" ordered #{popular_books[key]} people"
    end

    def save(f = 'library.dat')
      File.write(f, Marshal.dump(self)) ? true : "File 'library.dat' doesn't exists"
    end

  end
end
