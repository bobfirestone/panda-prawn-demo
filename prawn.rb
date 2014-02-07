

require 'prawn'

class PdfGenerate
  def generate(path)
    Prawn::Document.generate("gen-#{path}.pdf", background: "./images/gd-bg-612.png", top_margin: 72 ) do
      stroke_horizontal_rule
      pad(10) { text "Pandas are awesome.", align: :center }
      stroke_horizontal_rule
      
      move_down 30
      image "./images/panda-on-slide.jpg", position: :center
      
      move_down 50
      span(300, :position => :center) do
        text "Span is a bounding box as it lets the text " +
        "flow gracefully onto the next page. It doesn't matter if the text " +
        "started on the middle of the previous page, when it flows to the " +
        "next page it will start at the beginning." + " _ " * 500 +
        "I told you it would start on the beginning of this page."
      end
      
    end

    puts "The custom pages have been built"    
  end
end


class PdfConcat
  def generate(pdf_file_paths)

    Prawn::Document.generate("result-#{Time.now}.pdf", {:page_size => 'A4', :skip_page_creation => true}) do |pdf|
      pdf_file_paths.each do |pdf_file|
        if File.exists?(pdf_file)
          pdf_temp_nb_pages = Prawn::Document.new(:template => pdf_file).page_count
          (1..pdf_temp_nb_pages).each do |i|
            pdf.start_new_page(:template => pdf_file, :template_page => i)
          end
        end
      end
    end
    
    puts "The pdf files have been appended to the custom generated "
  end
end

class PdfGenerateBoth
  def go(path)
    PdfGenerate.new.generate(path)
    PdfConcat.new.generate(["gen-#{path}.pdf",'./pdfs/baby-panda.pdf','./pdfs/sleepy-panda.pdf','./pdfs/panda_cub.pdf'])
    puts "The compiled PDF is now ready"
  end
end

PdfGenerateBoth.new.go(Time.now)






# Tasking

# 1. Build cover pages -- This is the most work
#    size: Small
#    hours: 75-100 hrs 

# 2. Get prospectus PDF's for included funds from DA-Engine - ?How Hard?
#    size: XS
#    hours: 25 hrs

# 3. Combine cover pages and prospectus PDF's - Pretty easy once 1 & 2 are done
#    size: XS
#    hours: 10-20 hrs












