describe LogVisit do
  describe 'initialize' do
   
    it 'should contain a url ' do
      log_visit = described_class.new(url: '/home', ip_address: '10.1.0.12')

      expect(log_visit.url).to eq('/home')
    end

    it 'should contain an ip_address' do
       log_visit = described_class.new(url: '/home', ip_address: '10.1.0.12')

      expect(log_visit.ip_address).to eq('10.1.0.12')
    
     end
  end
end
