class GamesController

  EXP_CONSTANT = 2
  GIL_CONSTANT = 3

  def battle(**params)
    brave = params[:brave]
    monster = params[:monster]

    loop do
      brave.attack(monster)
      break if battle_end?(monster)
      monster.attack(brave)
      break if battle_end?(brave)
    end

    if battle_result(brave)
      result = colculate_of_exp_and_gil(monster)
      puts "#{brave.name}は戦いに勝った"
      puts "#{result[:exp]}pの経験値と#{result[:gil]}ギルを獲得"
    else
      puts "#{brave.name}は倒れた"
      puts "全滅した"
    end
  end

  private

    def battle_end?(character)
      character.hp <= 0
    end

    def battle_result(brave)
      brave.hp > 0
    end

    def colculate_of_exp_and_gil(monster)
      exp = (monster.offense + monster.defense) * EXP_CONSTANT
      gil = (monster.offense + monster.defense) * GIL_CONSTANT
      result = {exp: exp, gil: gil}

      result
    end
end