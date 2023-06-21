class Book
  attr_accessor :title, :rentals

  def initialize(title)
    @title = title
    @rentals = []
  end

  def add_rental(rental)
    rentals << rental
    rental.book = self
  end
end
