class ReportsController < ApplicationController
  def index
    @sidebar = 'reports:index'
    @content_header = 'All Reports'
    @report_list = Report.all
  end

  def show
    @sidebar = 'reports:info'
    @report = Report.find(params[:id])
    @park = Park.find(@report.park_id)
    @content_header = @report.full_name
  end
end