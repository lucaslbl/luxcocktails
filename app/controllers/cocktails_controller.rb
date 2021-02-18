class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show]
  def index
    # List all cocktails
    @cocktails = Cocktail.all
  end

  def create
    # Create new cocktails
  @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    # Add new cocktails
    @cocktail = Cocktail.new
  end

  def show; end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
