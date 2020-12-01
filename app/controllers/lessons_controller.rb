class LessonsController < ApplicationController
  def index
    @lessons = Category.paginate(page: params[:page], per_page: 5)
    @newlesson = Lesson.new
    # note to self
    # if words.any? under index.html.erb (lessons)
    # https://ruby-doc.org/core-2.0.0/Enumerable.html#method-i-any-3F
    @words = Word.where(category_id: params[:category_id])
  end

  def create
    @newlesson = Lesson.new(lesson_params)
    if @newlesson.save
      @lessonAct = Activity.create(actionable: Lesson.last, user_id: current_user.id)
      redirect_to start_lesson_url(@newlesson.category_id)
    else
      redirect_to lessons_url
    end
  end


  private
  def lesson_params
    params.require(:lesson).permit(:user_id, :category_id)
  end
end
