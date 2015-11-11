class ReportPdf
  include Prawn::View
  def generate(report)
    text report.campaign.name
    result_file = generate_temp_file(report.id)
    save_as(result_file.path)
    result_file
  end

  private
  def generate_temp_file(id)
    Tempfile.new(["report_#{id}", ".pdf"])
  end
end