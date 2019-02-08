class ReportsController < ApplicationController
  def index
    @sidebar = 'reports:index'
    @start_date = params[:start_date] || (Date.today - 3.week)
    @end_date = params[:end_date] || Date.today
    @valid_parks = generate_valid_park_list
    @selected_park = params[:selected_park]

    if @end_date <= @start_date
      @start_date = (Date.today - 3.week)
      @end_date = Date.today
      flash[:alert] = 'Start date was after or before end date. Search has been reset.'
    end

    @content_header = 'All Reports from ' + @start_date.to_s + " to " + @end_date.to_s
    @report_list = Report.reporting_parks_only.where("start_date >= ?", @start_date).where("end_date <= ?", @end_date)
    @report_list = @report_list.where(username: @selected_park) unless @selected_park.blank?
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

  def generate_valid_park_list
    result = [ ['All Parks', ''] ]

    Park.where(report: true).each do |park|
      result.push([park.name, park.username])
    end

    return result
  end
end