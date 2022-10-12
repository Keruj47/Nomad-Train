scoreboard objectives add nt.Nether_multiplier dummy
scoreboard objectives add nt.coordinates_X dummy
scoreboard objectives add nt.coordinates_Z dummy
scoreboard objectives add nt.Nether_coordinates_X dummy
scoreboard objectives add nt.Nether_coordinates_Z dummy
tellraw @a ["Load message from ",{"text":"Nomad Train","color":"#00FF00"}," datapack: "]
tellraw @a ["Hello ",{"selector":"@a","color":"yellow"}]
tellraw @a ["Train info: ",{"selector":"@e[type=create:carriage_contraption,limit=1]","color":"gold"}]