#Centering worldborder on a player (unless the train is in the Nether) and setting it's size
worldborder set 200
execute in minecraft:the_nether unless entity @e[type=create:carriage_contraption,limit=1,distance=0..] run execute at @e[type=player] run worldborder center ~ ~

#Creating data storage
data merge storage nt:worldborder_center_marker {Pos:[0d,0d,0d]}

#Creating scoreboards
scoreboard objectives add nt.Nether_multiplier dummy
scoreboard objectives add nt.coordinates_X dummy
scoreboard objectives add nt.coordinates_Y dummy
scoreboard objectives add nt.coordinates_Z dummy
scoreboard objectives add nt.Nether_coordinates_X dummy
scoreboard objectives add nt.Nether_coordinates_Z dummy

#Running tick function (to set-up the worldborder from the first tick, thus avoiding possible gap between load and first tick after load)
function nomad_train:tick

#Load message
tellraw @a ["Load message from ",{"text":"Nomad Train","color":"#00FF00"}," datapack: "]
tellraw @a ["Hello ",{"selector":"@a","color":"yellow"}]
tellraw @a ["Train info: ",{"selector":"@e[type=create:carriage_contraption,limit=1]","color":"gold"}]
