class Gate
  # ①運賃と駅名を配列として用意する
  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [150, 190]
  
  def initialize(name)
    @name = name
  end
  # 引数として渡された切符(Ticket)に自分の駅名を保存する
  def enter(ticket)
    ticket.stamp(@name)
  end
  
  # exitメソッドは引数として渡された切符(Ticket)から運賃(fare)と乗車駅を取得する
  # 乗車駅と自分の駅名から運賃を割り出す、運賃が足りていればtrue、不足していればfalse
 
  def exit(ticket)
    fare = calc_fare(ticket)
    fare <= ticket.fare
    
  end

  # ②駅名の配列から乗車駅と降車駅を検索し、その添字を取得する
  # ③「降車駅の添字-乗車駅の添字」で区間の長さを取得する
  # ④「区間の長さ-1」を添え字として運賃の配列から適切な運賃を取得する
  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    distance = to - from
    FARES[distance - 1]
  end
end