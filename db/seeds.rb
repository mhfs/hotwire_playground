# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Define animals for each family
# Define animals for each family (at least 20 per family)
animal_data = {
  mammal: %w[
    Lion Elephant Dog Bear Horse Tiger Giraffe Dolphin Zebra Monkey Wolf Fox Deer Kangaroo Platypus
    Cheetah Rhino Buffalo Bat Goat Leopard Sheep Cow Pig Camel Alpaca Yak Hedgehog Beaver Raccoon
    Otter Moose Sloth Armadillo Aardvark Koala Opossum Lemur Porcupine Meerkat Hyena Mole Donkey
    Llama Pangolin Wombat Squirrel Weasel Wolverine
  ],
  bird: %w[
    Eagle Penguin Parrot Owl Peacock Falcon Robin Hawk Pigeon Sparrow Flamingo Dove Crow Seagull Ostrich
    Albatross Swallow Woodpecker Hummingbird Nightingale Stork Crane Pelican Heron Kingfisher Sandpiper
    Parakeet Canary Macaw Kiwi Raven Vulture Kite Wren Puffin Bluebird Cardinal Jay Tanager Tern Gull
    Bunting Finch Chickadee Nuthatch Oriole Starling
  ],
  reptile: %w[
    Cobra Alligator Lizard Tortoise Snake Iguana Chameleon Crocodile Gecko Komodo\ Dragon Python Anaconda
    Viper Skink Monitor Garter Turtle Basilisk Gila\ Monster Terrapin Rattlesnake Boa Asp Coral\ Snake
    Bearded\ Dragon Green\ Iguana Frilled\ Lizard Horned\ Lizard Glass\ Lizard Racer Whiptail Sidewinder
    Desert\ Iguana Chuckwalla Water\ Dragon Eastern\ Collared\ Lizard Nile\ Monitor Leopard\ Gecko
    Panther\ Chameleon Savannah\ Monitor
  ],
  amphibian: %w[
    Frog Salamander Toad Newt Axolotl Bullfrog Treefrog Caecilian Fire\ Salamander Tiger\ Salamander
    Glass\ Frog Wood\ Frog Spotted\ Salamander Cane\ Toad Dart\ Frog Mole\ Salamander Spring\ Peeper
    American\ Toad Green\ Frog Northern\ Leopard\ Frog Southern\ Toad Pickerel\ Frog Eastern\ Newt
    Marbled\ Salamander Dusky\ Salamander Red-backed\ Salamander Blue-spotted\ Salamander Jefferson\ Salamander
    Long-toed\ Salamander Golden\ Mantella Oriental\ Fire-bellied\ Toad
  ],
  fish: %w[
    Shark Tuna Goldfish Trout Salmon Clownfish Catfish Sea\ Horse Snapper Angelfish Guppy Betta Swordfish
    Barracuda Grouper Mahi-mahi Haddock Marlin Carp Pufferfish Stingray Bass Perch Pike Cod Halibut
    Anchovy Sardine Mackerel Eel Sturgeon Tilapia Lamprey Paddlefish Minnow Bluefish Tarpon Bonefish
    Skate Sculpin Goby Herring Pollock Silverside Killifish Flyingfish
  ],
  invertebrate: %w[
    Butterfly Jellyfish Octopus Spider Crab Lobster Ant Dragonfly Beetle Worm Starfish Snail Slug
    Scorpion Centipede Millipede Tick Flea Mosquito Anemone Cuttlefish Squid Moth Fly Beetle Bee Wasp
    Firefly Termite Caterpillar Leech Hydra Coral Clam Mussel Cockroach Grasshopper Cicada Praying\ Mantis
    Shrimp Barnacle Bristleworm Nematode
  ]
}

# Seed the database
animal_data.each do |family, animals|
  animals.each do |name|
    Animal.create!(
      name: name,
      family: family
    )
  end
end

puts "Seeded #{Animal.count} animals successfully!"
