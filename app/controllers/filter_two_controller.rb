class FilterTwoController < ApplicationController
  def filter
    @suggestionsFromSole24Ore = ActiveRecord::Base.connection.select_all('SELECT stocks.isin, stocks.name, stocks.lastPrice, analyses.xxivOreShortTrend, analyses.xxivOreFTAIndex, analyses.xxivOreRSI FROM stocks INNER JOIN analyses ON analyses.isin = stocks.isin WHERE (analyses.xxivOreShortTrend = "molto rialzista" AND analyses.xxivOreFTAIndex > 50 AND analyses.xxivOreRSI > 75)')
  end
end
