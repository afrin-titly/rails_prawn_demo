class PdfGenerateJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    pdf = PdfGenerate.new.run
  end
end
