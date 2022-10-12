execute at @e[type=create:carriage_contraption,limit=1] align xz run worldborder center ~ ~
execute at @e[type=create:carriage_contraption,limit=1] align xyz run setworldspawn ~ ~ ~
execute as @a store result score @e[type=create:carriage_contraption,limit=1] nt.coordinates_X run data get entity @e[type=create:carriage_contraption,limit=1] Pos[0]
execute as @a store result score @e[type=create:carriage_contraption,limit=1] nt.coordinates_Z run data get entity @e[type=create:carriage_contraption,limit=1] Pos[2]