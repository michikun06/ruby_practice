def to_hex(r, g, b)
    hex = "#"
    [r, g, b].inject('#') do |hex, number|
        hex + number.to_s(16).rjust(2, '0')
    end
end

def to_ints(hex)
    r = hex[1..2]
    g = hex[3..4]
    b = hex[5..6]
    ints = []
    [r, g, b].map do |number|
        number.hex  
    end
end

