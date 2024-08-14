class ReviewsController < ApplicationController
   before_action :set_list

  # def new
  #   set_list
  #   @review = Review.new
  # end

  def create
    set_list
    @review = Review.new(review_params)
    @review.list = set_list
    if @review.save
      redirect_to list_path(@list), notice: 'Review was succesfully created.'
    else
      render :new, status: :unprocessable_entity
    end
    # render "lists/show"
  end

  # def destroy
  #   @review = Review.find(params[:id])
  #   @review.destroy
  #   redirect_to list_path(@review.list), status: :see_other
  # end

  private

  def set_list
    @list = List.find(params[:list_id])
  end
  def review_params
    params.require(:review).permit(:comment, :movie_id)
  end
end
