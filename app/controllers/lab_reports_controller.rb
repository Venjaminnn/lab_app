# frozen_string_literal: true

class LabReportsController < ApplicationController
  before_action :set_collection, only: [:show, :update]

  def new
  end

  def create
    lab_report = LabReport.create(lab_report_params)

    if lab_report.valid?
      redirect_to lab_reports_url, flash: { notice: 'Report was added' }
    else
      render :new, flash: { alert: 'Something went wrong' }
    end
  end
  
  private

  def lab_report_params
    params.permit(:title, :description, :user_id).permit!
  end
end
