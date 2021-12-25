require './lib/deep_freezable'

class Team
    extend DeepFreezable

    # deep_freezeメソッドに投げて配列の中身、全てをfreezeする
    COUNTRIES = deep_freeze(['Japan', 'US', 'India'])
end