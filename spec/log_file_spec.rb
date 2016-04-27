describe LogFile do
  subject { LogFile.new( File.dirname(File.absolute_path(__FILE__))+"/test_log.log") }
 
  describe 'initialize' do   
    it 'should contain a path and empty visits ' do     
      expect(subject.path).to end_with('test_log.log')
      expect(subject.log_visits).to eq([])
    end

  end

  describe '#parse_file' do
    it 'iterates over the log file and instantiates  Logvisits' do     
      subject.parse_file
      expect(subject.log_visits).to include(LogVisit)
      expect(subject.log_visits.size).to eq(4)      
    end
  end

  describe '#visits_by_urls' do 
    it 'should group visits by urls' do
      subject.parse_file
      expect(subject.visits_by_urls.size).to eq(2)
       end
  end

  describe '#counts_ordered_by_urls' do
     it 'should ordered by urls with a count of the visit' do
      subject.parse_file
      expect(subject.counts_ordered_by_urls.size).to eq(2)
       expect(subject.counts_ordered_by_urls).to eq([["/home", 2], ["/target", 2]])
      end
  end

  describe '#unique_counts_ordered_by_urls' do
     it 'should ordered by urls with a uniq ip count of the visit' do
      subject.parse_file
      expect(subject.unique_counts_ordered_by_urls.size).to eq(2)
      expect(subject.unique_counts_ordered_by_urls).to eq( [["/target", 2], ["/home", 1]])
      end
  end

 describe '#display_url_counts' do
     it 'should get list of hits for each url' do
      subject.parse_file
      expect(subject.display_url_counts).to eq("/home 2 visits \n/target 2 visits \n")
      end
  end

 describe '#display_url_counts_with_uniq_ip' do
     it 'should get list of uniq hits for each url' do
      subject.parse_file
      expect(subject.display_url_counts_with_uniq_ip).to eq("/target 2  unique views\n/home 1  unique views\n")
      end
  end
   
end
