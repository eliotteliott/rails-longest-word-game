require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
     # instance variable storing these random letters from the alphabet.
    @letters = (0...10).map { (65 + rand(26)).chr }
  end

  def score
    @score = params[:word]
    if english_word?(@score) == false
      @answer = "not_valid_english"
    end
  end

  def included?(word, grid)
    guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end
end
