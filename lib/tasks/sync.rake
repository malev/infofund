task :sync => :environment do
  url = "http://www.santanderrio.com.ar/individuos/inversiones_fondos_rendimiento.jsp"
  doc = Nokogiri::HTML(open(url))

  puts doc.at_css("title").text

  quotation_date = Object.new

  doc.css("#contenidosSeccion .notaText table tr").each do |tr|
    quotation_date = tr if tr.text =~ /Rendimientos/
  end

  str_date = /\d{2}\/\d{2}\/\d{4}/.match(quotation_date.text).to_s

  if Fund.loaded_at?(str_date)
    puts "The #{str_date} information has already been loaded."
  else
    puts "synchronizing..."
    doc.css("#contenidosSeccion .notaText table tr").each do |tr|
      if tr.at_css("td") and tr.at_css("td table")
        Fund.process(tr, str_date)
      end
    end
  end
end
