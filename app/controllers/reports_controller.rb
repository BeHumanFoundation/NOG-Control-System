class ReportsController < ApplicationController

  def index

  end

  def showAll
    @students = Student.all
  end




end
