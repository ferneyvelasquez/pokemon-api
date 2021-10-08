class PokemonSerializer
  include JSONAPI::Serializer
  attributes :number, :name, :type1, :type2, :total, :hp, :attack, :defense, :spAtk, :spDef, :speed, :generation, :legendary
end
