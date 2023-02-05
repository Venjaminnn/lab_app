# frozen_string_literal: true

class LabReportsController < ApplicationController
  before_action :set_collection, only: [:show, :update]

  def new
  end

  def show
    @lab_report = @lab_reports.find(params[:id])
  end

  def index
    @lab_reports = LabReport.all.includes(:user)
  end

  def create
    lab_report = LabReport.create(lab_report_params)

    if lab_report.valid?
      redirect_to lab_reports_url, flash: { notice: 'Report was added' }
    else
      render :new, flash: { alert: 'Something went wrong' }
    end
  end
  
  def update
    lab_report = @lab_reports.find_by(id: params[:id])

    if lab_report
      lab_report.update(update_params)

      redirect_to lab_reports_url, flash: { success: 'Report was updated' }
    else
      render :new, flash: { alert: 'Something went wrong' }
    end
  end

  def destroy
    lab_report = LabReport.find_by(id: params[:id])

    if lab_report
      lab_report.destroy

      redirect_to lab_reports_url, flash: { success: 'Report was deleted' }
    else
      render :new, flash: { alert: 'Something went wrong' }
    end
  end

  private

  def set_collection
    @lab_reports = LabReport.all
  end

  def update_params
    params.permit(:grade)
  end

  def lab_report_params
    params.permit(:title, :description, :user_id).permit!
  end
end
