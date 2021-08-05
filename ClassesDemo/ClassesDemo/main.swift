
let skeleton = Enemy(health: 100, attackStrength: 10)
let skeleton2 = Enemy(health: 100, attackStrength: 10) // Note NOT skeleton2 = skeleton
print(skeleton.health)
skeleton.move()
skeleton.attack()

// From subClass with Enemy being superClass
let dragon = Dragon(health: 300, attackStrength: 20)
dragon.move()
dragon.attack()
dragon.talk(speech: "I am a subClass")
