class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    if @category.save
      flash[:success]="Saved successfully"
      redirect_to categories_url
    else
      flash[:danger]="Invalid content. Try again."
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def update
    @category=Category.find(params[:id])
    if @category.update_attributes(categories_params)
      flash[:success]="Saved successfully"
      render 'edit'
    else
      flash[:danger]="Invalid content. Try again."
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:danger] = "Delete Successfully"
    redirect_to categories_url
  end

  private
  def categories_params
    params.require(:category).permit(:title, :description)
  end
end
