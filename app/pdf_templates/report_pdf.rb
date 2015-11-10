class ReportPdf
  include Prawn::View
  def initialize(name)
    @name = name
  end

  def file_name(id)
    Tempfile.new(["report_#{id}", ".pdf"])
  end

  def generate(report)
    text report.campaign.name
    save_as(file_name(id))
  end
end