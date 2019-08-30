# frozen_string_literal: true

class Startup
  attr_reader :name, :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self
  end

  def pivot(new_name)
    @name = new_name
  end

  def self.all
    @@all
  end

  def find_by_founder(founder)
    @@all.find { |startup| startup.name == founder }
  end

  def domains
    @@all.map(&:domain)
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select { |fr| fr.startup == self }
  end

  def num_of_funding_rounds
    funding_rounds.count
  end

  def total_funds
    funding_rounds.sum(&:investment)
  end

  def investors
    funding_rounds.map(&:venture_capitalist).uniq
  end

  def big_investors
    return nil if VentureCapitalist.tres_commas_club

    investors.select do |investor|
      VentureCapitalist.tres_commas_club.contains? investor
    end
  end
end
