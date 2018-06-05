class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "To-do was saved."
      redirect_to current_user
    else
      flash[:alert] = "There was an error saving the to-do. Please try again."
      redirect_to current_user
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "To-do done!"
    else
      flash.now[:alert] = "Error deleting. Please try again"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
