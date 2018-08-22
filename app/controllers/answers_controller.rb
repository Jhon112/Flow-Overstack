class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def show
    @answer = Answer.find(params[:answer_id])
    @commentable = @answer
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answers_params)  
    if @answer.save
      redirect_to question_path(@question)
    else
      # render 'questions/show', notice: "Write your answer before post it"
      redirect_to question_path(@question)
    end  
  end

  private 
  def answers_params
    params.require(:answer).permit(:text).merge(user: current_user)
  end
end
