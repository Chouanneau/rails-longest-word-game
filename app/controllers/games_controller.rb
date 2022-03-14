require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    @input = params[:letters]

    def english_word?(word)
      response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
      json = JSON.parse(response.read)
      return json['found']
    end

    if english_word?(@word)
        @answer = "well done, you scored with #{@word}"
    else
        @answer = "#{@word} does not exist, read a book you moron!"
    end
end


end
