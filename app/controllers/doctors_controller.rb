# frozen_string_literal: true

class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:edit, :update, :show, :destroy]

  def index
    @doctors = Doctor.all.order('id ASC')
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      redirect_to doctors_path
    else
      flash[:error] = @doctor.errors&.messages
      render 'new'
    end
  end


  def show
  end

  def edit 
  end

  def update
    @doctor = Doctor.find(params[:id])

    if @doctor.update(doctor_params)
      flash[:notice] = "Doctor was successfully updated"
      redirect_to doctors_path
    else
      flash[:error] = "Doctor can not be updated"
      render 'edit'
    end
  end

  def destroy
    message = @doctor.destroy ? {notice: "Doctor was successfully deleted"} : {error: "Doctor couldn't be deleted"}
    if @doctor.destroy
      redirect_to doctors_path, message
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :practicing_from, :qualification_number, :employment)
  end
end
