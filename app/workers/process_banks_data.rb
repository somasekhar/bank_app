class ProcessBanksData
  attr_accessor :file_path, :total_rows, :errors

  class << self
    #args = {:file_path => "file.csv"}
    def process!(args={}, &block)
      new(args).process!(&block)
    end
  end

  def initialize(args)
    @file_path = args[:file_path] || "#{Rails.root}/public/banks_data.csv"
    @total_rows = 0
    @errors = []
  end

  def process!(&block)
    File.readlines(file_path).each_with_index do |line, index|
      next if index == 0
      @total_rows = index
      begin
        data_arr = line.strip.split(",")
        bank = Bank.find_or_create_by(name: data_arr[0])
        Tenure.find_or_create_by(bank_id: bank.id, months: data_arr[1].to_i, rate: data_arr[2].to_f, minimum_amount: data_arr[3].to_f)
      rescue => e
        errors.push("Row No: #{index} - #{e.to_s}")
      end
    end
    block.call(self) if block_given?
  end


end