class WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @words = Word.where(category_id: params[:category_id])
  end

  def new
    @word = Word.new
    @category = Category.find(params[:category_id])
    4.times { @word.choices.build }
  end

  def create
    @word = Word.new(words_params)
    if @word.save
      flash[:success]="Word added successfully"
      redirect_to cataword_url(@word.category_id)
    else
      flash[:danger]="Failed to add word"
      redirect_to cataword_url(@word.category_id)
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update_attributes(words_params)
      flash[:success]="Saved successfully"
      redirect_to cataword_url(@word.category_id)
    else
      flash[:danger]="Invalid content. Try again."
      redirect_to cataword_url(@word.category_id)
    end
  end

  def destroy
    @word = Word.find(params[:id])
    Word.find(params[:id]).destroy
    flash[:danger] = "Delete Successfully"
    redirect_to cataword_url(@word.category_id)
  end

  private
  def words_params
    params.require(:word).permit(:category_id,:word, choices_attributes: [:id,:word_id, :choices, :correct])
  end
end