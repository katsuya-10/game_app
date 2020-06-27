require './message_dialog'

class GamesController

  include MessageDialog

  EXP_CONSTANT = 2
  GIL_CONSTANT = 3

  def battle(**params)
    build_characters(params)

    loop do
      @brave.attack(@monster)
      break if battle_end?
      @monster.attack(@brave)
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
      result = calculate_of_exp_and_gil

      end_message(result)
    end

    def calculate_of_exp_and_gil
      if brave_win?
        brave_win_flag = true
        exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
        gil = (@monster.offense + @monster.defense) * GIL_CONSTANT
      else
        brave_win_flag = false
        exp = 0
        gil = 0
      end

      {brave_win_flag: brave_win_flag, exp: exp, gil: gil}
    end
end