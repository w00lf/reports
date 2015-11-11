class ReportPdfCreateService < Aldous::Service
  attr_accessor :report

  def initialize(report)
    @report = report
  end

  def perform
    return Result::Failure.new if @report.campaign.blank?
    pdf_file = ReportPdf.new.generate(@report)
    @report.pdf = pdf_file
    Result::Success.new
  end
end