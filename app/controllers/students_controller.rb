class StudentsController < ApplicationController

  before_action :set_student, only: [:show,:edit,:update]

  def index
      @students = Student.paginate(page: params[:page], per_page: 3)
  end

  def new
    @subjects = Subject.all
    @student = Student.new
  end

  def show
  end

  def edit
    @subjects = Subject.all
  end

  def update
  #  binding.pry
    if(subjects_params == nil)
      @student.subjects.delete_all
    else
      @subjects = Subject.find(subjects_params)
      @student.subjects.delete_all
      @subjects.each do |subject|
        @student.subjects << subject
        @student.save
      end
    end
    if @student.update(student_params)
      flash[:success] = "Aluno editado com sucesso"
      redirect_to students_path
    else
      flash[:danger] = "Erro ao editar aluno"
      render :new
    end
  end

  def create
    @student = Student.new(student_params)
    if(subjects_params != nil)
      @subjects = Subject.find(subjects_params)
      @student.subjects << @subjects
      @student.save
    end
    #binding.pry
    if @student.save
      flash[:success] = "Aluno criado com sucesso!"
      redirect_to students_path
    else
      flash[:danger] = "Erro ao criar aluno"
      render :new
    end
  end

  private

    def student_params
      #params.require(:student).permit!
      params.require(:student).permit(:name, :rg, :phone, :address, :birthday, :scholarity, :responsible_id, :subjects)
    end

    def subjects_params
      subjectsParams = params.require(:student)['subjects_id']
    end

    def set_student
      @student = Student.find(params[:id])
    end

end
