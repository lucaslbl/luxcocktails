class CocktailsController < ApplicationController
  before_action :find_cocktail, only: %i[show edit update destroy]
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

  def show
    @dose = Dose.new
  end

  def edit;  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
