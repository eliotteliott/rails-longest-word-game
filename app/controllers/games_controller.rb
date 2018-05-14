class GamesController < ApplicationController
  def new
     # instance variable storing these random letters from the alphabet.
    @letters = (0...10).map { (65 + rand(26)).chr }
  end

  def score
    @score = params[:word]
  end
end
