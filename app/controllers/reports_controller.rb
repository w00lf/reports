class ReportsController < ApplicationController
  include ::ActionController::Serialization
  respond_to :json, :html
  before_filter :authenticate_user!

  def index
    @reports = paginate(Report)
    respond_with(@reports)
  end

  def show
    @report = Report.find(params[:id])
    respond_with(@report, serializer: ReportSerializer) do |format|
      format.json { render json: ReportSerializer.new(@report).to_json }
      format.pdf { render_pdf(@report.pdf.path) }
    end
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(campaign_params)
    ReportPdfCreateService.perform(@report)
    @report.save
    respond_with(@report, serializer: ReportSerializer) do |format|
      format.json { render json: ReportSerializer.new(@report).to_json }
    end
  end

  private
  def campaign_params
    params.require(:report).permit(:campaign_id)
  end

  def render_pdf(file_path)
    file = File.open(file_path).read.force_encoding('BINARY')
    send_data(file, filename: "#{@report.campaign.name}.pdf", type: "application/pdf")
  end
end
