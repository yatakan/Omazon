module ReviewsHelper

  def review_rate_stars(rate)
    @star = ""
    for i in 1..rate
      @star += "★"
    end
    @star.length
    while @star.length < 5
      @star += "☆"
    end
    return @star
  end

  def average_rate_stars(reviews)
    if reviews.present?
      rate = reviews.average(:rate).round
      review_rate_stars(rate)
    else
      content_tag :p, "まだレビューはありません"
    end
  end
end
