# GLibrary

Ruby gem Library class

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'GLibrary', :git => "git://github.com/sprokopchuk/GLibrary.git"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install GLibrary

## Usage


```ruby
  # Create a new Library or load data from file 'library.dat' if exists it
  lib = GLibrary::Library.new

  # Or load data from other file
  lib = GLibrary::Library.new(f = 'data.dat')

  #New author
  a = GLlibrary::Author.new("Joe Dou", "I was born in 1888 ...")

  # Add new author to library or reject if it exist in library already
  lib << a

  # What is the most popular book
  lib.most_popular_book

  # Who often takes the book
  lib.fan_book(lib.books[0])

  # How many people ordered one of the three(or other amount) most popular books
  lib.num_readers_most_popular_books(num = 3)

  # Save library to file library.dat
  lib.save

  #or to other file
  lib.save(f = 'data.dat')

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/GLibrary/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
