execute in minecraft:overworld if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run execute at @e[type=create:carriage_contraption,limit=1] align xz run worldborder center ~ ~
execute in minecraft:overworld if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run execute at @e[type=create:carriage_contraption,limit=1] align xyz run setworldspawn ~ ~ ~

execute as @a store result score @e[type=create:carriage_contraption,limit=1] nt.coordinates_X run data get entity @e[type=create:carriage_contraption,limit=1] Pos[0]
execute as @a store result score @e[type=create:carriage_contraption,limit=1] nt.coordinates_Y run data get entity @e[type=create:carriage_contraption,limit=1] Pos[1]
execute as @a store result score @e[type=create:carriage_contraption,limit=1] nt.coordinates_Z run data get entity @e[type=create:carriage_contraption,limit=1] Pos[2]

scoreboard players set @e[type=create:carriage_contraption,limit=1] nt.Nether_multiplier 8
scoreboard players operation @e[type=create:carriage_contraption,limit=1] nt.Nether_coordinates_X = @e[type=create:carriage_contraption,limit=1] nt.coordinates_X
scoreboard players operation @e[type=create:carriage_contraption,limit=1] nt.Nether_coordinates_Z = @e[type=create:carriage_contraption,limit=1] nt.coordinates_Z
scoreboard players operation @e[type=create:carriage_contraption,limit=1] nt.Nether_coordinates_X *= @e[type=create:carriage_contraption,limit=1] nt.Nether_multiplier
scoreboard players operation @e[type=create:carriage_contraption,limit=1] nt.Nether_coordinates_Z *= @e[type=create:carriage_contraption,limit=1] nt.Nether_multiplier