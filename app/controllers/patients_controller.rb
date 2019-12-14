# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all.includes(:doctor).order('id ASC')
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      flash[:notice] = "Patient was successfully created"
      redirect_to patients_path
    else
      flash[:error] = "Patient can not be created"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update

    if @patient.update(patient_params)
      flash[:notice] = "Patient was successfully updated"
      redirect_to patients_path
    else
      flash[:error] = "Patient can not be updated"
      render 'edit'
    end
  end

  def destroy
    message = @patient.destroy ? {notice: "Patient was successfully deleted"} : {error: "Patient couldn't be deleted"}
    if @patient.destroy
      redirect_to patients_path, message
    end
  end

  private
  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :age, :gender, :doctor_id)
  end
end
