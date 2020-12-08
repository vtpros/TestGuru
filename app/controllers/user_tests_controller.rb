class UserTestsController < ApplicationController
  before_action :find_user_test, only: %i[show update result]

  def index
    @user_tests = UserTest.all
  end

  def show; end

  def result; end

  def update
    @user_test.accept!(params[:answer_ids])
    if @user_test.completed?
      @user_test.set_result
      redirect_to result_user_test_path(@user_test)
    else
      render :show
    end
  end

  private

  def find_user_test
    @user_test = UserTest.find(params[:id])
  end

  #def user_test_params
    #params.require(:answer).permit(:answer_ids)
  #end
end
