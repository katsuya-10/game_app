class Brave
  # 複数の値を同時に指定できる
  attr_reader :name, :offense, :defense
  # セッターゲッターを一括定義
  attr_accessor :hp

  # new演算子から渡された引数を受け取る**paramsを設定でハッシュ値しか受け付けないようにする
  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

end

class Monster
  attr_reader :name, :offense,  :defense
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

end

# 勇者クラスをインスタンス化
brave = Brave.new( name: "クラウド", hp: 500, offense: 150, defense: 100)
# brave2 = Brave.new("ティファ", 300, 200, 80)
# brave3 = Brave.new("バレット", 700, 30, 200)
monster = Monster.new(name:"セフィロス", hp: 1000, offense: 100, defense: 100)

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
