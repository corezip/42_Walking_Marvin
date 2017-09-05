
class GymAIEnv(object, game):
    """
    ..........
    """

    env = gym.make(game)
    observation = env.reset()
    in_dimen = env.observation_space.shape[0]
    out_dimen = env.action_space.shape[0]
    obsMin = env.observation_space.low
    obsMax = env.observation_space.high
    actionMin = env.action_space.low
    actionMax = env.action_space.high

    # Why 13, 8 and 13??? lol!
    node_count = [in_dimen, 13, 8, 13, out_dimen]