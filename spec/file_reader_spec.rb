require_relative '../lib/file_reader.rb'

describe FileReader do
  describe '.initialize'do
    it 'initializes with file' do
      file_path = './spec/fixtures/test.json'

      f = FileReader.new(file_path)

      expect(File.basename(f.file)).to eql(File.basename(file_path))
    end
  end

  describe '.parse' do
    context 'incorrect file' do
      it 'outputs error message' do
        message = "Please provide correct file\n"
        expect { FileReader.new('./spec/fixtures/test-1.json').parse() }.to output(message).to_stdout
      end
    end

    context 'correct file' do
      it 'returns the command from text file' do
        file_path = './spec/fixtures/test.json'

        customers = FileReader.new(file_path).parse()

        expect(customers).to be_an_instance_of(Array)
        expect(customers).to all(be_an_instance_of(Customer))
        expect(customers.size).to eq(32)
      end
    end
  end
end
