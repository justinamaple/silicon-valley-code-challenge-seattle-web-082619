# frozen_string_literal: true

require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
tears_for_fears = Startup.new('TearsForFears', 'Ren', 'Tech')
just_juice = Startup.new('Just Juice', 'Ian', 'Food')
justin = VentureCapitalist.new('Justin')
kara = VentureCapitalist.new('Kara')
tff_round1 = tears_for_fears.sign_contract(justin, 'Angel', 50.0)
jj_round1 = just_juice.sign_contract(justin, 'Angel', 300.0)
tff_round2 = tears_for_fears.sign_contract(justin, 'Angel', 500.0)
jj_round2 = just_juice.sign_contract(justin, 'First Seed', 1_000_000_000.0)
tff_round3 = justin.offer_contract(tears_for_fears, 'First Seed', 500_000)
jj_round3 = kara.offer_contract(just_juice, 'Angel', 800_000_000)

binding.pry
0 # leave this here to ensure binding.pry isn't the last line
