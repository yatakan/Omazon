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

  def average_rate(reviews)
    if reviews.present?
      rate = "5つ星のうち" + reviews.average(:rate).to_s
      return rate
    else
      content_tag :p, "この商品の最初のレビューを書きませんか？"
    end
  end

  def count_reviews(reviews)
    if reviews.present?
      count = "投稿数" + reviews.length.to_s
      return count
    end
  end

  def percent_in_bar(reviews)
  end
end
