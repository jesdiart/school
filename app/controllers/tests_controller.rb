class TestsController < ApplicationController

  def show
    @subject = Subject.find(params[:subject_id])
    @test = authorize Test.find(params[:id])
  end

  def new
    @subject = Subject.find(params[:subject_id])
    @test = authorize Test.new
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @test = authorize @subject.tests.create(test_params)
    
    if @test.save!
      redirect_to @subject
    else 
      render :new
    end 
  end

  private
    def test_params
      params.require(:test).permit(:name)
    end

end
