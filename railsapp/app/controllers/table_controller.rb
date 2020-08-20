class TableController < ActionController::Base
  def show
    @start_time = Time.now
    # test = PdfGenerate.new
    # puts test.run
    @end_time = Time.now
    @process_time = @end_time - @start_time
  end

  def runner
    # PdfGenerateJob.perform_later
    @starting = Time.now
    pdf = PdfGenerateTest.new.render
    send_data pdf,
    #       filename:    'test_pdf.pdf',
          type:        'application/pdf',
          disposition: 'inline' # 画面に表示
    # redirect_to table_path
    @ending = Time.now
    logger.debug("-----#{@ending-@starting}")
  end
end
