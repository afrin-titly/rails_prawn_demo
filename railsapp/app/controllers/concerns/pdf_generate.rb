class PdfGenerate < Prawn::Document



    def run

        # super(page_size: 'A4', top_margin: 40, bottom_margin: 30, left_margin: 20, right_margin: 20)
        Prawn::Document.generate("#{Rails.root}/app/assets/pdf/landscape.pdf",
                                  :page_size => 'A4',
                                  :page_layout => :landscape,
                                  :top_margin => 40,
                                  :bottom_margin => 30,
                                  :left_margin => 20,
                                  :right_margin => 10) do |pdf|

            pdf.font 'app/assets/fonts/ipaexm.ttf' # fontをパスで指定

            $pages = 5
            $pages.times do |i|
                pdf.stroke_axis
                header(pdf, i)
                # pdf.move_down 50
                images(pdf)
                if i==0
                  tables1(pdf)
                  tables2(pdf)
                  contents(pdf)
                  footer(pdf)
                else
                  tables2(pdf)
                  contents(pdf)
                  footer(pdf)
                end
            end
            puts("------end")

        end

    end

    def header(pdf, page)
        # pdf.font 'app/assets/fonts/ipaexm.ttf' # fontをパスで指定
        # 日本語フォントを使用しないと日本語使えません
        # pdf.font_families.update('Test' => { normal: 'app/assets/fonts/ipaexm.ttf', bold: 'app/assets/fonts/ipaexg.ttf' })
        # pdf.font 'Test'
        pdf.draw_text '請　求　書', :at => [350, 520], :width => 100, :height => 100, size: 30
        pdf.line([350, 510], [500, 510])      #下辺
        pdf.stroke                      #描画
        pdf.draw_text '(1期) 2019/11/01〜2019/11/10', :at => [350, 490], :width => 100, :height => 100, size: 10
        pdf.draw_text '(2期) 2019/11/11〜2019/11/20', :at => [350, 475], :width => 100, :height => 100, size: 10
        pdf.draw_text '(3期) 2019/11/21〜2019/11/30', :at => [350, 460], :width => 100, :height => 100, size: 10


        # 請求先　会社情報
        pdf.draw_text '株式会社　サナス　様', :at => [0, 500], size: 17
        pdf.draw_text '〒 123-4567', :at => [5, 475], size: 14
        pdf.draw_text '鹿児島県　鹿児島市.xxxxxxxxx', :at => [5, 460], size: 14
        pdf.draw_text 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', :at => [5, 445], size: 14
        pdf.draw_text 'TEL 088-888-9999   FAX 088-888-8888', :at => [5, 430], size: 14

        # 発行元会社情報
        pdf.draw_text 'Post Code  890-1234', :at => [550, 475], size: 14
        pdf.draw_text 'Kagoshima city / Kagoshima pref.xxxxxxxxx', :at => [550, 460], size: 14
        pdf.draw_text 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', :at => [550, 445], size: 14
        pdf.draw_text 'TEL 099-999-9999   FAX 099-999-8888', :at => [550, 430], size: 14
        pdf.draw_text 'ABC Company Co.,ltd.', :at => [550, 405], size: 17

        # ページ、請求番号、発行日
        pdf.draw_text "ページ #{page + 1} / #{$pages}", :at => [600, 530], size: 12
        pdf.draw_text "請求書番号: 12345-678901234-56789", :at => [600, 515], size: 12
        pdf.draw_text "発効日: #{Time.now}", :at => [600, 500], size: 12

        def images(pdf)
            image = "#{Rails.root}/app/assets/images/pass.png"
            pdf.transparent(0.5) do
            pdf.image image,:at => [700, 480], :width => 100
            end
        end

    end



      def tables1 (pdf)
        pdf.move_down 140
        t = pdf.make_table([ ["incoming fee", "outgoing fee", "keeping", "others", "total", "tax"],
                            ["1","2","3","4","5","6"]])
        t.draw
        pdf.move_up 90
      end

      def tables2 (pdf)
        pdf.move_down 140
        1.times do |i|
          pdf.table([ ["品番", "品名", "諸掛", "K", "前期残数", "数量", "重量", "単位", "単価", "小計", "金額"],
                            ["1","2","3","4","5","6","7","8","9","10","11"],
                            ["1","2","3","4","5","6","7","8","9","10","11"],
                            ["1","2","3","4","5","6","7","8","9","10","11"],
                            ["1","2","3","4","5","6","7","8","9","10","11"],
                            ["1","2","3","4","5","6","7","8","9","10","11"],
                            ["1","2","3","4","5","6","7","8","9","10","11"],
                            ["1","2","3","4","5","6","7","8","9","10","11"],
                            ["1","2","3","4","5","6","7","8","9","10","11"],
                            ["1","2","3","4","5","6","7","8","9","10","11"],],
                            :column_widths => [70, 200, 50, 25, 60, 60, 60, 40, 60, 60, 70],
                            :row_colors => ["F0F0F0", "FFFFCC", "FFFFCC", "FFFFCC", "FFFFCC", "FFFFCC", "FFFFCC", "FFFFCC", "FFFFCC", "FFFFCC", "FFFFCC"])

          end
      end

      def contents(pdf)
          pdf.move_down 10
          pdf.text 'end of this page'
      end

      def footer(pdf)
          pdf.start_new_page #=> Starts new page keeping current values
      end



end

# pdf = PdfGenerate.new
