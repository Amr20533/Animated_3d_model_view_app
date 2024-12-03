class AnimationModel {
  String name;
  String animationKey;

  AnimationModel({required this.name, required this.animationKey});

  static List<AnimationModel> animations = [
    AnimationModel(
        name: "Static Pose",
        animationKey: "ref",
    ),
    AnimationModel(
        name: "Bounce",
        animationKey: "bounce",
    ),
    AnimationModel(
        name: "Chicken Start Walk",
        animationKey: "chicken_start_walk02",
    ),
    AnimationModel(
        name: "Flap Falling",
        animationKey: "flap_falling",
    ),
    AnimationModel(
        name: "Idle",
        animationKey: "idle01",
    ),
    AnimationModel(
        name: "Idle Water",
        animationKey: "idle01_water",
    ),
    AnimationModel(
        name: "Peck Idle",
        animationKey: "peck_idle2",
    ),
    AnimationModel(
        name: "Chicken Scared (1)",
        animationKey: "chicken_scared01",
    ),
    AnimationModel(
        name: "Chicken Scared (2)",
        animationKey: "chicken_scared02",
    ),
    AnimationModel(
        name: "Bounce Water",
        animationKey: "bounce_water",
    ),
    AnimationModel(
        name: "Bunny Hop",
        animationKey: "bounce_water",
    ),
    AnimationModel(
        name: "Run",
        animationKey: "run01",
    ),
    AnimationModel(
        name: "Run flap water",
        animationKey: "run01flap_water",
    ),
    AnimationModel(
        name: "Walk",
        animationKey: "walk01",
    ),
    AnimationModel(
      name: "Chicken Squat Cycle (1)",
      animationKey: "chicken_squat_cycle01",
    ),
    AnimationModel(
      name: "Walk Flap Water",
      animationKey: "walk01_water",
    ),
    AnimationModel(
      name: "Chicken Squat Cycle (2)",
      animationKey: "chicken_squat_cycle02",
    ),
  ];
}
