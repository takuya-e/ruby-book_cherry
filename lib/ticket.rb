#stampメソッドの実装：このメソッドに駅名を渡すとその駅名がTicketクラスのインスタンスに保存される
#乗車駅を取得する場合はTicketクラスのstamped_atメソッドを使う
class Ticket
  #運賃(fare)と乗車駅(stamped_at)が外部から取得できないといけない
  attr_reader :fare, :stamped_at
  def initialize(fare)
    @fare = fare
  end

  #@stamped_atに駅名を格納している
  def stamp(name)
    @stamped_at = name
  end
end