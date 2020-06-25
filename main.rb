class Brave
  # 複数の値を同時に指定できる
  attr_reader :name, :offense, :defense
  # セッターゲッターを一括定義
  attr_accessor :hp

  # new演算子から渡された引数を受け取る
  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

end
# 勇者クラスをインスタンス化
brave = Brave.new( name: "クラウド", hp: 500, offense: 150, defense: 100)


# 値を取り出す
puts <<~TEXT
名前:#{brave.name}
HP:#{brave.hp}
攻撃:#{brave.offense}
防御:#{brave.defense}
TEXT

# hpにダメージを与える処理
brave.hp -= 30

# ダメージに関するメッセージ
puts "#{brave.name}はダメージを受けた！残りHPは#{brave.hp}だ"

