require 'open-uri'

class WebSearcher
  
  # Search for html strings html at url
  #  removing whitespace is the only massaging done for the search in this implementation
  def self.find_html_in_site(html_items, url)
    result = {}
    open(url) { |io|
      flat_html = io.read.gsub!(/\s+/, "")
      html_items.each do |item|
        result[item] = flat_html.include?(item.gsub(/\s+/, ""))
      end
    }
    return result
  end
  
end