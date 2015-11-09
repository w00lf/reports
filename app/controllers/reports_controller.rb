class ReportsController < ApplicationController
  before_filter :authenticate_user!

  # GET /campaigns
  def index
    @campaigns = paginate(Report)
  end

  # GET /campaigns/1
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Report.new
  end

  # POST /campaigns
  def create
    @campaign = Report.new(campaign_params)

    if @campaign.save
      redirect_to @campaign, notice: 'Report was successfully created.'
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
