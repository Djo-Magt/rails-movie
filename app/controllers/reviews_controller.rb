class ReviewsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.list = @list
    respond_to do |f|
      if @review.save
        f.html { redirect_to list_path(@list) }
        f.json
      else
        @favori = Favori.new
        f.html { render "lists/show", status: :unprocessable_entity }
        f.json
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:commentaire, :rating)
  end
end
