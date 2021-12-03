UNIT = { m: 1.0, ft: 3.28, in: 39.37 }

def convert_length(length, from: :m, to: :m)
    (UNIT[to] / UNIT[from] * length).round(2)
end