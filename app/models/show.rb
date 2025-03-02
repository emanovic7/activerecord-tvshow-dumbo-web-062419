class Show < ActiveRecord::Base



  def self.highest_rating
    self.maximum(:rating)
  end

  def self.most_popular_show
    self.all.map do |show|
      if show.rating == self.highest_rating
        return show
      end
    end
  end


  def self.lowest_rating
    self.minimum(:rating)
  end

  def self.least_popular_show
    self.all.map do |show|
      if show.rating == self.lowest_rating
        return show
      end
    end
  end

  def self.ratings_sum
    self.sum(:rating)
  end

  def self.popular_shows
    self.where("rating > ?", 5)
  end


  def self.shows_by_alphabetical_order
    self.order(name: :asc)
  end

end


# lowest_rating: returns the lowest value in the ratings column.
