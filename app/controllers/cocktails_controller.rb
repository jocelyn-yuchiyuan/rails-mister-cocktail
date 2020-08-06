class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render 'new.html.erb'
    end
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(restaurant_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render 'edit.html.erb'
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
