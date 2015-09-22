require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def setup
    @student = Student.new(name:"Eduardo Pedroso", rg:"12345678",phone: "19 981713271", address: "Rua Doutor,32,Vila Suica", scholarity: 'Ensino Superior' )
  end

  test "student should be valid" do
    assert @student.valid?
  end

  test "student name should be present" do
    @student.name = " "
    assert_not @student.valid?
  end

  test "student rg should be present" do
    @student.rg = " "
    assert_not @student.valid?
  end


end
