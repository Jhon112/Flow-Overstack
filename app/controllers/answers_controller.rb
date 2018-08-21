class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # def index
  #     @answers = Answer.all
  #     @answers = @answers.where("question_id = ?", Answer.find(params[:question_id]))
  #    # redirect_to question_path
  # end

  # def show
  #   @answer = Answer.find(params[:question_id])
  # end

  # def new
  #   @answer = Answer.new
  # end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answers_params)  
    if @answer.save
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question), notice: "Write your answer before post it"
    end  
  end

  # def edit
  #   @answer = answer.find(params[:id])
  # end

  # def update
  #   @answer = answers.find(params[:id])
  #   if @answer.update(answer_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #       @answer = Answer.find(params[:id])
  #       @answer.destroy
  #       redirect_to root_path
  # end

  private 
  def answers_params
    params.require(:answer).permit(:text).merge(user: current_user)
  end
end
