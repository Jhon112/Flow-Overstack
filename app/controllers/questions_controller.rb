class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    before_action :authenticate_user!

  end

  def create
    before_action :authenticate_user!

  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    
  end

  def destroy
    
  end
end
