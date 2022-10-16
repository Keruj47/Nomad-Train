#Executing general function (applicable in all cases)
function nomad_train:general

#Executing overworld function (if the train is in Overworld)
execute in minecraft:overworld if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run function nomad_train:overworld

#Executing the_nether function (if the train is in the Nether)
execute in minecraft:the_nether if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run function nomad_train:the_nether