class ItemsController < ApplicationController
  before_action :find_list

  # def index
  # 	@item = @list.item.find(params[:id])
  # end

  def new
  	@item = Item.new
  end

  def create
  	@item = @list.item.new(item_params)
  	if @item.save 
  		redirect_to list_path(@list)
  	else
  		render :new
    end
  end

  def show
  	@item = @list.items.find(params[:id])
  end

  def edit
  	@item = @list.item.find(params[:id])
  end

  def update
  	@item = @list.items.find(params[:id])
		if @item.update(item_params)
			redirect_to list_item_path(@list, @item)
		else
			render :edit
		end
  end

  def destroy
  	@item = @list.items.find(params[:id])
		@item.destroy
		redirect_to list_path(@list)
  end

  private

  def find_list
  	@list = List.find(params[:list_id])
  end

  def item_params
  	params.require(:item).permit(:name, :description, :completed, :list_id)
  end
end
