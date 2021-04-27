(defn bubble-sort!
  [arr]
  (def arr-len (length arr))
  (when (< arr-len 2)
    (break arr))
  # at this point there are two or more elements
  (loop [i :down-to [(dec arr-len) 0]]
    (for j 0 i
      (def left-elt (get arr j))
      (def right-elt (get arr (inc j)))
      (when (> left-elt right-elt)
        (put arr j right-elt)
        (put arr (inc j) left-elt))))
  arr)

(comment

  (bubble-sort! @[])
  # => @[]

  (bubble-sort! @[1])
  # => @[1]

  (bubble-sort! @[1 3 2])
  # => @[1 2 3]

  (bubble-sort! @[5 4 1 8 7 2 6 3])
  # => @[1 2 3 4 5 6 7 8]

  (bubble-sort! @[2 3 2])
  # => @[2 2 3]

  (let [n 100
        arr (seq [i :range [0 n]]
              (* n (math/random)))]
    (deep= (bubble-sort! (array ;arr))
           (sort (array ;arr))))
  # => true

  )
