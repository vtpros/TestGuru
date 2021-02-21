class Admin::TestsController < Admin::BaseController
  before_action :test, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def show; end

  def create
    @test = Test.new(test_params)
    @test.author = current_user
    if @test.save
      redirect_to [:admin, @test], success: t('.success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], success: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to action: :index
  end

  private

  def test
    @test ||= Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_test_not_found
    render 'shared/errors/record_not_found', status: :not_found
  end
end
