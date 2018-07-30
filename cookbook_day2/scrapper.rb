require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class Scrapper
  def initialize(keyword)
    @url = "https://www.marmiton.org/recettes/recherche.aspx\?aqt\=#{keyword}"
  end

  def call
    doc = Nokogiri::HTML(open(@url))
    doc.css('.recipe-card').map do |element|
      Recipe.new(
        name: element.css('.recipe-card__title').text,
        description: element.css('.recipe-card__description').text.strip,
        prep_time: element.css('.recipe-card__duration__value').text.strip
      )
    end
  end
end
