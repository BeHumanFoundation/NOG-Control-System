class LessonsController < ApplicationController
  def index
    @lessons = Lesson.paginate(page: params[:page], per_page: 5)
    @subjects = Subject.all
  end

  def new
    # binding.pry
    @lesson = Lesson.new
    @subject = Subject.find(subjects_params)
    @students = Student.all
    @selectedStudents ||= []
    @students.each do |student|
        if student.subjects.include? @subject
          @selectedStudents << student
        end
    end
    #binding.pry
  end

  def create
    if(params[:subject_id] != nil)
      Rails.cache.write('subject_selected_id',params[:subject_id])
    end
    @lesson = Lesson.create()
    @lesson.teacher = current_user
    @lesson.subject = Subject.find(params[:subject_id])
    if @lesson.save
      flash[:success] = "Aula criada com sucesso"
      redirect_to edit_lesson_path(@lesson)
    else
      flash[:danger] = "Erro ao criar aula."
      render :new
    end
  end

  def edit
    if(subjects_params == nil)
      @selectedSubjectId = Rails.cache.read('subject_selected_id')
    end
    @lesson = Lesson.find(params[:id])
    @subject = Subject.find(@selectedSubjectId)
    @students = Student.all
    @selectedStudents ||= []
    @students.each do |student|
        if student.subjects.include? @subject
          @selectedStudents << student
        end
    end
  end

  def update
    @lesson = Lesson.find(params[:id])
    binding.pry
    if get_faults.empty
      @studentsWithFaults = get_faults
      @studentsWithFaults.each do |student|
        @fault = Fault.create(lesson: @lesson, student: Student.find(student))
      end
    else
      @fault = Fault.create(lesson: @lesson)
    end
    if @fault.errors == nil
      flash[:success] = "Aula criada com sucesso"
      redirect_to lesson_path
    else
      flash[:danger] = "Erro ao criar aula"
      render :new
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    if @lesson.destroy
      flash[:success] = "Aula deletada com sucesso"
      redirect_to lessons_path
    else
      flash[:danger] = "Erro ao deletar aula"
      render :new
    end
  end

  private

    def lesson_params
      params.permit!
    end

    def subjects_params
      @subjectId = params[:subject_id]
      return @subjectId
    end

    def get_faults
      if params[:student]['faults']
        return params[:student]['faults']
      else
        return nil
      end
    end

end
