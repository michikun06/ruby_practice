class Gate
    # 駅名と運賃を配列で管理する（配列にはシンボルを使用）
    STATIONS = [:umeda, :juso, :mikuni]
    FARES = [150, 190]

    def initialize(name)
        @name = name
    end

    # 引数として渡されたticketに駅名を保存する
    def enter(ticket)
        ticket.stamp(@name)
    end

    # 切符（Ticket）から運賃（fare）と乗車駅を取得する
    # 乗車駅と現在の駅から運賃を割り出す。足りていればtrue、足りなければfalseを返す。
    # ticketには現在の駅名が入る。
    def exit(ticket)
        fare = calc_fare(ticket)
        fare <= ticket.fare
    end

    # 運賃が適切かどうか調べるメソッド
    def calc_fare(ticket)

        # indexメソッドで引数の値と合致する配列の添字番号を取得する
        from = STATIONS.index(ticket.stamped_at)     #乗車駅を取得
        to = STATIONS.index(@name)      #現在いる駅（降車駅）を取得
        distance = to - from
        FARES[distance - 1]
    end
end