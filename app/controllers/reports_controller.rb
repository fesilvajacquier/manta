class ReportsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create]

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    authorize @report
    if @report.save
      # redirect_to report_path(@report)
    else
      # render :new
    end
  end

  private

  def report_params
    params.require(:report).permit(:category, :content, :ngo_id)
  end

end
