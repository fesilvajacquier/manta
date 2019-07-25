class ReportsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create]

  def create
    @report = Report.new(report_params)
    authorize @report
    if @report.save
      # raise
      # flash[:notice] = "Report created succesfully"
    end
  end


  private

  def report_params
    params.require(:report).permit(:phone_number, :category, :content, :ngo_id)
  end

end
