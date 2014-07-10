require 'open-uri'

class WebSearcher
  
  # Search for html strings in html at url using open-uri basic html search
  #  removing whitespace is the only massaging done for the search in this implementation
  def self.find_html_in_site_basic(html_items, url)
    result = {}
    open(url) { |io|
      flat_html = io.read.gsub!(/\s+/, "")
      html_items.each do |item|
        result[item] = flat_html.include?(item.gsub(/\s+/, ""))
      end
    }
    return result
  end
  
  # Search for selectors in document at url using phantomjs running on ironworker
  def self.find_selectors_in_site(selectors, url)
    client = Rails.application.config.iw_client
    request = {"url" => url}
    request = request.merge({"selectors" => selectors})
    task_id = client.tasks.create('phantom', request.to_json)
    return task_id.id
  end
  
end