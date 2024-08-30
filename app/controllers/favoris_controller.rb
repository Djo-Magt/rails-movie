class FavorisController < ApplicationController
  before_action :set_favori, only: [:destroy]

  def create
    @list = List.find(params[:list_id])
    @favori = Favori.new(favori_params)
    @favori.list = @list
    if @favori.save
      redirect_to list_path(@list)
    else
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    @favori.destroy
    redirect_to list_path(@favori.list), status: :see_other
  end

  private

  def favori_params
    params.require(:favori).permit(:text, :movie_id)
  end

  def set_favori
    @favori = Favori.find(params[:id])
  end
end
