class ListsController < ApplicationController
  def index
    @lists = List.where(user_id:current_user.id)
  end
 
  def show
  	@list = List.find(params[:id])
    # @items = @list.item
    @items = Item.where(list_id: params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)

      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :place, :description, :completed, :user_id)
  end

end
