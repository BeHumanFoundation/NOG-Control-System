class TeachersController < ApplicationController

  before_action :set_teacher, only: [:show,:edit,:update]

  def index
    @teachers = Teacher.paginate(page: params[:page], per_page: 3)
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      flash[:success] = "Voluntário criado com sucesso"
      redirect_to teachers_path
    else
      flash[:danger] = "Erro ao criar voluntário"
      render :new
    end
  end

  def show
    # @teachers = Teacher.where(responsible_id: params[:id])
  end

  def edit
  end

  def update
    if @teacher.update(teacher_params)
      flash[:success] = "Voluntário editado com sucesso"
      redirect_to teachers_path
    else
      flash[:danger] = "Erro ao editar voluntário"
      render :new
    end
  end

  private

    def teacher_params
      params.require(:teacher).permit(:name, :cpf, :phone, :password_digest, :profession, :email, :address, :birthday)
    end

    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

end
