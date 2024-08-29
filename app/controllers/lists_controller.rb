class ListsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
    @list = List.new
  end

  def create
    @lists = List.all
    @list = List.new(list_params)
    respond_to do |f|
      if @list.save
        f.html { redirect_to lists_path }
        f.json
      else
        f.html { render :new, status: :unprocessable_entity }
        f.json
      end
    end
  end

  def show
    @favori = Favori.new
  end

  def edit
  end

  def update
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
