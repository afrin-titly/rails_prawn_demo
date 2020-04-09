class PdfGenerate < Prawn::Document

    def run

        # super(page_size: 'A4', top_margin: 40, bottom_margin: 30, left_margin: 20, right_margin: 20)
        Prawn::Document.generate("#{Rails.root}/app/assets/pdf/explicit.pdf") do |pdf|
            pdf.stroke_axis
            header(pdf)
            pdf.move_down 50
            images(pdf)
            100.times do |i|
                contents(pdf)
                tables(pdf)
            end
            puts("------end")
        end

    end

    def header(pdf)
        pdf.text 'PDF', size: 50
        pdf.move_down 20
        pdf.text 'world', size: 14
    end
    
    def contents(pdf)
        pdf.text 'english'
        pdf.move_down 10
        pdf.text 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
              Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
              Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
              Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
              Prawn is a pure Ruby PDF generation library that provides a lot of great functionality while trying to remain simple and reasonably performant. Here are some of the important features we provide:
              Vector drawing support, including lines, polygons, curves, ellipses, etc.
              Extensive text rendering support, including flowing text and limited inline formatting options.
              Support for both PDF builtin fonts as well as embedded TrueType fonts
              A variety of low level tools for basic layout needs, including a simple grid system
              PNG and JPG image embedding, with flexible scaling options
    
              '
              
    end
    
    def images(pdf)
        pdf.text 'images'
        pdf.move_down 10
        image = "#{Rails.root}/app/assets/images/english_cafe.png"
        
        pdf.image image,:width => 450
      end
    
      def tables(pdf)
        pdf.move_down 10
        t = pdf.make_table([ ["this is the first row"],["this is the second row"] ])
        t.draw
        pdf.move_down 20
        50.times do |i|
          pdf.table([ ["short", "short", "loooooooooooooooooooong"],
                  ["short", "loooooooooooooooooooong", "short"],
                  ["loooooooooooooooooooong", "short", "short"],
                  ["1", "2", "3"] ])
          end
      end
    
end

# pdf = PdfGenerate.new

