function rip
    expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl
end
