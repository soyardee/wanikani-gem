# -*- encoding : utf-8 -*-
RSpec.describe Wanikani::SpacedRepetitionSystem do
  describe '#find_by' do
    let(:endpoint) { 'https://api.wanikani.com/v2/spaced_repetition_systems' }
    let(:subjects_response) { File.new('spec/fixtures/spaced_repetition_systems.json') }

    before(:each) do
      stub_request(:get, endpoint).to_return(body: subjects_response,
                                             headers: headers)
    end

    context 'without attributes' do
      it 'returns collection response' do
        response = subject.find_by
        expect(response).to be_a Wanikani::Response
        expect(response.object).to eq('collection')
      end

      it 'returns expected total_count' do
        expect(subject.find_by.total_count).to eq(2)
      end
    end
  end

  describe '#find' do
    let(:id) { 49_392 }
    let(:endpoint) { "https://api.wanikani.com/v2/spaced_repetition_systems/#{id}" }
    let(:kanji_response) { File.new('spec/fixtures/spaced_repetition_system.json') }

    before do
      stub_request(:get, endpoint).to_return(body: kanji_response,
                                             headers: headers)
    end

    context 'without attributes' do
      it 'returns spaced_repition_system response' do
        response = subject.find(id)
        expect(response).to be_a Wanikani::Response
        expect(response.object).to eq('spaced_repetition_system')
      end
    end
  end
end
