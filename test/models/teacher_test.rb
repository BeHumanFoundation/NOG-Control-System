require 'test_helper'

class TeacherTest < ActiveSupport::TestCase

  def setup
    @teacher = Teacher.new(name:"Eduardo Pedroso", email:"teste@teste.com",cpf:"123456789",
    cep:"13333000",profession:"Developer",phone: "19 981713271", address: "Rua Doutor,32,Vila Suica")
  end

  test "teacher should be valid" do
    assert @teacher.valid?
  end

  test "teacher name should be present" do
    @teacher.name = " "
    assert_not @teacher.valid?
  end

  test "teacher cpf should be present" do
    @teacher.cpf = " "
    assert_not @teacher.valid?
  end


end
