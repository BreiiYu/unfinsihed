class ChoicesController < ApplicationController
  # def index
  #   @choices = Choice.all
  # end

  # def new
  #   @choice = Choice.new
  # end

  # def create
  #   @choice = Choice.new(choice_params)
  #   if @choice.save
  #     flash[:success]="Saved successfully"
  #     redirect_to choice_url
  #   else
  #     flash[:danger]="Invalid content. Try again."
  #     render 'new'
  #   end
  # end

  # def edit
  #   @choice = Choice.find(params[:id])
  # end

  # def destroy
  #   choice.find(params[:id]).destroy
  #   flash[:danger] = "Delete Successfully"
  #   redirect_to choices_url
  # end

  # private
  # def choices_params
  #   params.require(:choice).permit(:choice)
  # end
end
