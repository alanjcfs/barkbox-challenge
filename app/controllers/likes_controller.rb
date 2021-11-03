class LikesController < ApplicationController
  def create
    @dog = Dog.find(params[:dog_id])
    @like = Like.new(user_id: current_user.id, dog_id: @dog.id)

    if @like.save
      respond_to do |format|
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.json { render json: @dog.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    if @like.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def likes_params
    params.permit(:dog_id, :user_id)
  end
end
