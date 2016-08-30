require 'csv'

class PncToWave

  COLS = {
    transaction_type: 5,
    description: 2,
    amount: 1,
    date: 0
  }

  DEFAULTS = {}

  def initialize(raw_data, logger, opts={})
    @opts = DEFAULTS.merge(opts)
    @logger = logger
    @raw_data = raw_data
  end

  def convert_debits_to_negative
    CSV.foreach(@raw_data, headers:true, skip_blanks: true).each do |row|
      next if row.to_hash.values.all?(&:empty?)
      if row[COLS[:transaction_type]] == "DEBIT" && !row[COLS[:amount]].start_with?("-")
        row[COLS[:amount]] = (-row[COLS[:amount]].to_f).to_s
      end
      puts [
        row[COLS[:date]],
        row[COLS[:description]],
        row[COLS[:amount]]
      ].join(',')
    end
  end
end
