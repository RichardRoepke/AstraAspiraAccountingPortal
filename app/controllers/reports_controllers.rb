class ReportsControlers < ApplicationController
  def index
    @sidebar = 'reports:index'
    @content_header = 'All Reports'
    @report_list = Report.all
  end

  def show
    @sidebar = 'reports:info'
    @report = Report.find(params[:id])
    @park = Park.find(@report.park_id)
    @content_header = @park.name  + ' Report (' + @report.start_date.to_s + '-' + @report.end_date.to_s + ')'
  end
end