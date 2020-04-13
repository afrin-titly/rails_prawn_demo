class TableController < ActionController::Base
  def show
    @start_time = Time.now
    # test = PdfGenerate.new
    # puts test.run
    @end_time = Time.now
    @process_time = @end_time - @start_time
  end

  def runner
    PdfGenerateJob.perform_later
    redirect_to table_path
  end
end
