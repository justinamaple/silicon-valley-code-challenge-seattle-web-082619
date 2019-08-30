# frozen_string_literal: true

class VentureCapitalist
  attr_reader :name

  @@all = []
  ONE_MIL = 1_000_000_000

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    all.select { |vc| vc.total_worth > ONE_MIL }
  end

  def offer_contract(startup, type, investment)
    startup.sign_contract(self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select { |fr| fr.venture_capitalist == self }
  end

  def total_worth
    funding_rounds.sum(&:investment)
  end

  def portfolio
    funding_rounds.map(&:startup).uniq
  end

  def biggest_investment
    funding_rounds.max_by(&:investment)
  end

  def invested(domain)
    domain_funds = funding_rounds.select { |fr| fr.startup.domain == domain }
    domain_funds.sum(&:investment)
  end
end
