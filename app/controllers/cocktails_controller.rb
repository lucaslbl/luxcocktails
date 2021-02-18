class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show]
  def index
    # Listar todos os restaurantes
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktails_path
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
  end

  def show; end

  def update
  end

  def delete
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
