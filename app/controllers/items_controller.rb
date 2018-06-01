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

  private

  def item_params
    params.require(:item).permit(:name)
  end
end 
