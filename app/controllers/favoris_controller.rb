class FavorisController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_list, only: [:destroy]

  def index
    @favoris = Favori.find(params[list_id])
  end

  def create

  end

  def destroy

  end

  private

  def favori_params
    params.require(:favori).permit(:text)
  end

  def set_favori
    @favori = Favori.find(params[:id])
  end
end
