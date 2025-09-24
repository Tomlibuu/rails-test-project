class AppController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]
  def index
    @recipes = Recipe.all
  end
end
