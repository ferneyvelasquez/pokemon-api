FactoryBot.define do
  sequence :number do |n|
    "#{n}"
  end
  sequence :name do |n|
    "Bulbasaur Test#{n}"
  end
  factory :pokemon do
    number { generate :number }
    name { generate :name }
    type1 { "Grass" }
    type2 { "Poison" }
    total { 318 }
    hp { 45 }
    attack { 49 }
    defense { 49 }
    spAtk { 65 }
    spDef { 65 }
    speed { 45 }
    generation { 1 }
    legendary { false }
  end
end
