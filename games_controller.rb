class GamesController
  EXP_CONSTANT = 2
  GIL_CONSTANT = 3

  def battle(**params)
    build_characters(params)

    loop do
      @brave.attack(monster)
      break if battle_end?
      @monster.attack(brave)
      break if battle_end?
    end

    battle_judgment
  end

  private

    def build_characters(**params)
      @brave = params[:brave]
      @monster = params[:monster]
    end

    def battle_end?
      @brave.hp <= 0 || @monster.hp <= 0
    end

    def brave_win?
      @brave.hp > 0
    end

    def battle_judgment

      if brave_win?
        result = colculate_of_exp_and_gil
        puts "#{@brave.name}は戦いに勝った"
        puts "#{result[:exp]}pの経験値と#{result[:gil]}ギルを獲得"
      else
        puts "#{@brave.name}は倒れた"
        puts "全滅した"
      end
    end

    def calculate_of_exp_and_gil
      exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
      gil = (@monster.offense + @monster.defense) * GIL_CONSTANT
      result = {exp: exp, gil: gil}

      result
    end
end