class LoginsController < ApplicationController

  def new

  end

  def create
    teacher = Teacher.find_by(email: params[:email])
    if teacher && teacher.authenticate(params[:password])
      session[:teacher_id] = teacher.id
      flash[:success] = "Você está logado!"
      redirect_to root_path
    else
      flash.now[:danger] = "Erro ao logar"
      render 'new'
    end
  end

  def destroy
    session[:teacher_id] = nil
    redirect_to root_path
  end
end
