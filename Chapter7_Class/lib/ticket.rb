class Ticket
    # 外部から運賃と乗車駅が取得できるように設定
    attr_reader :fare, :stamped_at

    def initialize(fare)
        @fare = fare
    end

    # Ticketクラスのインスタンスに駅名が保存される
    def stamp(name)
        @stamped_at = name     # 乗車駅をインスタンス変数に保存する
    end
end