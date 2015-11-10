class ReportsController < ApplicationController
  before_filter :authenticate_user!

  # GET /campaigns
  def index
    @reports = paginate(Report)
  end

  # GET /campaigns/1
  def show
    @report = Report.find(params[:id])
  end

  # GET /campaigns/new
  def new
    @report = Report.new
  end

  # POST /campaigns
  def create
    @report = Report.new(campaign_params)

    if @report.save
      redirect_to @report, notice: 'Report was successfully created.'
    else
      render :new
    end
  end

  private
  # Only allow a trusted parameter "white list" through.
  def campaign_params
    params.require(:report).permit(:campaign_id)
  end
end
