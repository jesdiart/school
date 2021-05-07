class ResultsController < ApplicationController

  def new
    @subject = Subject.find(params[:subject_id])
    @test = Test.find(params[:test_id])
    @student = Student.find(params[:student_id])
    @result = authorize Result.new(test_id: params[:test_id])
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @test = Test.find(params[:test_id])
    @student = Student.find(result_params[:student_id])
    @result = authorize @test.results.create(result_params.merge(teacher_id: current_user.id))
    
    if @result.save!
      redirect_to subject_test_path(@subject, @test)
    else 
      render :new
    end 
  end

  private
    def result_params
      params.require(:result).permit(:test_id, :teacher_id, :student_id, :mark)
    end

end
