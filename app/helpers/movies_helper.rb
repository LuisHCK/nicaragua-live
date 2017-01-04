module MoviesHelper
  def movie_date(in_human_date)
    #in_human_date.date.strftime()
    I18n.l(in_human_date, format: "%A %d %B, %Y")
  end

end
