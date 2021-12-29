class SnacksController < ApplicationController
  def show
    @snacks = Snack.all
  end
end
