require_relative 'log_visit'

class LogFile
  attr_reader :path, :log_visits

  def initialize(path)
    @path = path
    @log_visits = []
  end

  def parse_file
    File.read(path).each_line do |line|
          url, ip = line.split
          @log_visits << LogVisit.new(url: url, ip_address: ip)
    end
  end

  def visits_by_urls
    @visits_by_urls ||= log_visits.group_by { |entry| entry.url }
  end

  def counts_ordered_by_urls
    visits_by_urls.map { |url, visits| [url, visits.count] }.
      sort { |a, b| b.last <=> a.last }
  end

  def unique_counts_ordered_by_urls
    visits_by_urls.map { |key, value| [key, value.map(&:ip_address).uniq.count] }.
      sort { |a, b| b.last <=> a.last }
  end

  def display_url_counts
     to_display =""
     counts_ordered_by_urls.each do  |key,value| 
      to_display +="#{key} #{value} visits \n"
      end
     to_display
  end

  def display_url_counts_with_uniq_ip
     to_display =""
     unique_counts_ordered_by_urls.each do  |key,value| 
      to_display +="#{key} #{value}  unique views\n"
      end
     to_display
 
  end
 
end
