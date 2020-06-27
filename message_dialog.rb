module MessageDialog
    def attack_message(**params)
      attack_type = params[:attack_type]

      puts "#{@name}の攻撃"
      puts "凶切り" if attack_type == "special_attack"
    end

    def damage_message(**params)
      target = params[:target]
      damage = params[:damage]

      puts <<~EOS

      "#{target.name}は#{damage}のダメージを受けた"
      "#{target.name}の残りHPは#{target.hp}だ"

      EOS
    end

    def end_message(result)
      if result[:brave_win_flag]
        puts <<~EOS

        クラウドは勝った
        #{result[:exp]}の経験値と#{result[:gil]}ギルを手に入れた

        EOS
      else
        puts <<~EOS

        クラウドは倒れた
        全滅した

        EOS
      end
    end

    def transform_message(**params)
      origin_name = params[:origin_name]
      transform_name = params[:transform_name]

      puts <<~EOS

      #{origin_name}の様子がおかしい
      #{origin_name}は#{transform_name}に変化した

      EOS
    end
end