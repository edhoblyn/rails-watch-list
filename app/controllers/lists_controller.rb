class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

   private

   def list_params
     params.require(:list).permit(:name)
   end
end



#   def edit
#     @flat = Flat.find(params[:id])
#   end

#   def update
#     @flat = Flat.find(params[:id])
#     if @flat.update(flat_params)
#       redirect_to flat_path(@flat)
#     else
#       render :edit, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     @flat = Flat.find(params[:id])
#     @flat.destroy
#     redirect_to flats_path, status: :see_other
#   end
