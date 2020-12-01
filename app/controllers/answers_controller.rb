class AnswersController < ApplicationController
  def new
    @answers = Answer.new
    @categories = Category.find(params[:category_id])
    @words = Word.select("words.*").joins("LEFT JOIN answers ON words.id = answers.word_id LEFT JOIN lessons ON lessons.category_id = words.category_id").where("answers.id IS NULL AND lessons.user_id =  #{current_user.id} AND lessons.id = #{params[:category_id]}").limit(1)
    @lesson_id = Lesson.where(user_id: current_user.id, category_id: @categories.id).limit(1)
    @ttlcntr = Word.where(category_id: params[:category_id]).count
    @anscntr = Answer.where(lesson_id: @lesson_id.ids).count
    @current = Answer.joins("LEFT JOIN choices ON answers.choice_id = choices.id LEFT JOIN lessons ON lessons.lessons.id").where("lesson_id = #{@lesson_id.ids[0]} AND lessons.user_id = #{current_user.id}");
    
    if @ttlcntr == @anscntr
      redirect_to results_url(@categories.id)
    end
  end

  def create
    @answers = Answer.new(answ)
    @exist = Answer.where(lesson_id: @answers.lesson_id, word_id: @answers.word_id)
    
    if @exist.exists?
      flash[:danger] = "You already submitted the answer"
      redirect_back fallback_location: root_path
    else 
      if @answers.save
        flash[:success] = "Saved"
        redirect_back fallback_location: root_path
      else
        flash[:danger] = "Failed"
        redirect_back fallback_location: root_path
      end #end check
    end
    
  end

  def show
    @categories = Category.find(params[:category_id])
    @words = Word.where(category_id: params[:category_id])
    @lesson = Lesson.where(user_id: current_user.id, category_id: params[:category_id])
    @ans = Answer.where(lesson_id: @lesson.ids)
    @choices = Choice.all
    @correct = Choice.where(correct: true)
    @count = 0
  end

  private
  def answ
    params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
  end
end
