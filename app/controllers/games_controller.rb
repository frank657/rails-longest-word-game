require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    rand(8..20).times { @letters << ('a'..'z').to_a.sample }
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    @total_score = session[:score].nil? ? 0 : session[:score]

    word_split = @word.split("")
    if !word_split.all? { |letter| word_split.count(letter) <= @letters.split(" ").count(letter) }
      @message = "Can you spell?"
    elsif JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{@word}").read)["found"] == false
      @message = "Do you speak English?"
    else
      score = @word.length * 10
      @message = "Boom! your score is #{score}"
      session[:score] += score
    end
  end
end

# The word can't be built out of the original grid
# The word is valid according to the grid, but is not a valid English word
# The word is valid according to the grid and is an English word
