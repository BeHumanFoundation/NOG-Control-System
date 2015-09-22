class ResponsiblesController < ApplicationController

  before_action :set_responsible, only: [:show,:edit,:update]

  def index
    @responsibles = Responsible.paginate(page: params[:page], per_page: 3)
  end

  def new
    @responsible = Responsible.new
  end

  def create
    @responsible = Responsible.new(responsible_params)

    if @responsible.save
      flash[:success] = "Responsável criado com sucesso"
      redirect_to responsibles_path
    else
      flash[:danger] = "Erro ao criar responsável"
      render :new
    end
  end

  def show
    @students = Student.where(responsible_id: params[:id])
  end

  def edit
  end

  def update
    if @responsible.update(responsible_params)
      flash[:success] = "Responsável editado com sucesso"
      redirect_to responsibles_path
    else
      flash[:danger] = "Erro ao editar responsável"
      render :new
    end
  end

  private

    def responsible_params
      params.require(:responsible).permit(:name, :cpf, :phone, :phone_job, :profession, :email, :address, :birthday)
    end

    def set_responsible
      @responsible = Responsible.find(params[:id])
    end

end
