require 'test_helper'

class EducationProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @education_program = education_programs(:one)
  end

  test "should get index" do
    get education_programs_url
    assert_response :success
  end

  test "should get new" do
    get new_education_program_url
    assert_response :success
  end

  test "should create education_program" do
    assert_difference('EducationProgram.count') do
      post education_programs_url, params: { education_program: { title: @education_program.title } }
    end

    assert_redirected_to education_program_url(EducationProgram.last)
  end

  test "should show education_program" do
    get education_program_url(@education_program)
    assert_response :success
  end

  test "should get edit" do
    get edit_education_program_url(@education_program)
    assert_response :success
  end

  test "should update education_program" do
    patch education_program_url(@education_program), params: { education_program: { title: @education_program.title } }
    assert_redirected_to education_program_url(@education_program)
  end

  test "should destroy education_program" do
    assert_difference('EducationProgram.count', -1) do
      delete education_program_url(@education_program)
    end

    assert_redirected_to education_programs_url
  end
end
