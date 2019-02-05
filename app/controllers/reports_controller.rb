class ReportsController < ApplicationController
  def index
    @sidebar = 'reports:index'
    @content_header = 'All Reports'
    @report_list = Report.reporting_parks_only
  end

  def show
    @sidebar = 'reports:info'
    @report = Report.find(params[:id])
    @park = Park.find(@report.park_id)
    @content_header = @report.full_name

    if @report.blank? || @park.blank? || !@park.report?
      flash[:error] = 'Report could not be found.'
      redirect :back
    end
  end
end